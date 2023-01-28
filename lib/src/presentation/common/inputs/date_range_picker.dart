import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';
import 'package:recipes_app/src/data/common/extensions/date_time_extension.dart';
import 'package:recipes_app/src/presentation/common/buttons/clickable_widget.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';
import 'package:recipes_app/src/presentation/core/styles/app_typography.dart';

import '../../../data/common/classes/pair.dart';

enum DateRangePickerViewMode {
  date,
  month,
  year,
  decade,
}

enum DayOfWeek {
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
  sun,
}

extension DayOfWeekX on DayOfWeek {
  String get asString {
    switch (this) {
      case DayOfWeek.mon:
        return 'пн';
      case DayOfWeek.tue:
        return 'вт';
      case DayOfWeek.wed:
        return 'ср';
      case DayOfWeek.thu:
        return 'чт';
      case DayOfWeek.fri:
        return 'пт';
      case DayOfWeek.sat:
        return 'сб';
      case DayOfWeek.sun:
        return 'вс';
    }
  }
}

class DateCellData {
  final DateTime day;
  final bool isCurrentMonth;
  final bool isWeekend;

  DateCellData({
    required this.day,
    required this.isCurrentMonth,
    required this.isWeekend,
  });
}

enum _CustomRangeDatePickerTapStage {
  noTap,
  tapped,
  secondTapped,
}

extension _CustomRangeDatePickerTapStageX on _CustomRangeDatePickerTapStage {
  bool get isNoTap => this == _CustomRangeDatePickerTapStage.noTap;

  bool get isTapped => this == _CustomRangeDatePickerTapStage.tapped;

  bool get isSecondTapped =>
      this == _CustomRangeDatePickerTapStage.secondTapped;
}

class CustomRangeDatePicker extends StatefulWidget {
  final Pair<DateTime, DateTime>? initialDateRange;
  final DateRangePickerViewMode initialViewMode;
  final double? width;
  final double? height;
  final bool showPresentDate;
  final BoxDecoration? presentCellDecoration;
  final BoxDecoration? selectedCellDecoration;
  final BoxDecoration? selectedRangeCellDecoration;
  final EdgeInsets? selectedRangeCellPadding;
  final Color? backGroundColor;
  final Color? foreGroundColor;
  final BoxDecoration? decoration;
  final BorderRadius? radius;

  const CustomRangeDatePicker({
    Key? key,
    this.initialDateRange,
    this.initialViewMode = DateRangePickerViewMode.date,
    this.width,
    this.height,
    this.showPresentDate = true,
    this.presentCellDecoration,
    this.selectedCellDecoration,
    this.selectedRangeCellDecoration,
    this.selectedRangeCellPadding,
    this.backGroundColor,
    this.decoration,
    this.radius,
    this.foreGroundColor,
  }) : super(key: key);

  @override
  State<CustomRangeDatePicker> createState() => _CustomRangeDatePickerState();
}

class _CustomRangeDatePickerState extends State<CustomRangeDatePicker>
    with TickerProviderStateMixin {
  late DateTime today;
  late DateTime presentDate;
  late int currentMonth;
  late int currentYear;
  late Pair<int, int> currentDecade;
  late Pair<int, int> currentCentury;
  late DateTime currentDate;
  late DateTime firstDateOfMonth;
  late DateTime lastDateOfMonth;
  late int weeksAmount;
  late List<List<DateCellData>> dateCells;
  late List<List<GlobalKey>> cellsKey;
  late DateRangePickerViewMode viewMode;

  DateTime? firstDateSelected;
  DateTime? firstDateSelectedR;
  DateTime? firstDateTapped;
  DateTime? lastDateSelected;

  late Color cellColor = Colors.white;
  late Color selectedCellColor = Colors.white;
  late Color noSelectionCellColor = Colors.white.withOpacity(0.5);
  late Color weekendCellColor = Colors.redAccent;

  bool selectMode = false;
  _CustomRangeDatePickerTapStage tapStage =
      _CustomRangeDatePickerTapStage.noTap;

  late GlobalKey titleKey;

  late BoxDecoration selectedDateCellDecoration =
      widget.selectedCellDecoration ??
          BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(400),
          );

  late BoxDecoration selectedDateRangeCellDecoration =
      widget.selectedRangeCellDecoration ??
          BoxDecoration(
            color: Colors.purple.withOpacity(0.5),
          );

  late BoxDecoration presentDateCellDecoration = widget.presentCellDecoration ??
      BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          border: Border.all(
            width: 1,
            color: Colors.purpleAccent,
          ));

  late BoxDecoration decoration = widget.decoration ??
      BoxDecoration(
        color: widget.backGroundColor ?? Colors.black87,
        borderRadius: widget.radius ?? BorderRadius.zero,
      );

  late final AnimationController _fadeCalendarController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _fadeCalendarAnimation = CurvedAnimation(
    parent: _fadeCalendarController,
    curve: Curves.easeInOutCubic,
  );

  late final AnimationController _fadeMonthController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _fadeMonthAnimation = CurvedAnimation(
    parent: _fadeMonthController,
    curve: Curves.easeInOutCubic,
  );

  String convertMonthToString(int month, [bool short = false]) {
    switch (month) {
      case 1:
        return short ? 'Янв' : 'Январь';
      case 2:
        return short ? 'Фев' : 'Февраль';
      case 3:
        return short ? 'Мар' : 'Март';
      case 4:
        return short ? 'Апр' : 'Апрель';
      case 5:
        return short ? 'Май' : 'Май';
      case 6:
        return short ? 'Июн' : 'Июнь';
      case 7:
        return short ? 'Июл' : 'Июль';
      case 8:
        return short ? 'Авг' : 'Август';
      case 9:
        return short ? 'Сен' : 'Сентябрь';
      case 10:
        return short ? 'Окт' : 'Октябрь';
      case 11:
        return short ? 'Ноя' : 'Ноябрь';
      case 12:
        return short ? 'Дек' : 'Декабрь';
      default:
        return '';
    }
  }

  @override
  void initState() {
    today = DateTime.now();
    presentDate = DateTime(today.year, today.month, today.day);
    viewMode = widget.initialViewMode;
    firstDateSelected = widget.initialDateRange?.l;
    lastDateSelected = widget.initialDateRange?.r;
    generateInfo(today);
    _fadeCalendarController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(CustomRangeDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _fadeCalendarController.dispose();
    _fadeMonthController.dispose();

    super.dispose();
  }

  void generateInfo(DateTime date,
      {DateRangePickerViewMode viewMode = DateRangePickerViewMode.date}) {
    setState(() {
      currentMonth = date.month;
      currentYear = date.year;
      currentDate = DateTime(currentYear, currentMonth);
      int tmp = (currentYear / 10).floor();
      currentDecade = Pair(tmp * 10, (tmp + 1) * 10 + 2);
      tmp = (currentYear / 100).floor();
      currentCentury = Pair(tmp * 100, (tmp + 1) * 100 + 2 * 10);
      firstDateOfMonth = date.startOfMonth;
      lastDateOfMonth = date.endOfMonth.subtract(const Duration(days: 1));
      if (viewMode == DateRangePickerViewMode.date) {
        var tmp = generateMonth();
        dateCells = tmp[0];
        cellsKey = tmp[1];
      }
      _fadeMonthController.reset();
      _fadeMonthController.forward();
    });
  }

  List<dynamic> generateMonth() {
    int dayOfWeek = firstDateOfMonth.weekday;
    List<DateCellData> week = [];
    List<GlobalKey> weekKeys = [];
    List<List<DateCellData>> weeks = [];
    List<List<GlobalKey>> weeksKeys = [];
    DateTime dat;
    for (int i = 0; i < dayOfWeek - 1; i++) {
      dat = firstDateOfMonth.subtract(Duration(days: dayOfWeek - i - 1));
      week.add(DateCellData(
          day: dat,
          isCurrentMonth: false,
          isWeekend: dat.isSaturday || dat.isSunday));
      weekKeys.add(LabeledGlobalKey(dat.toString()));
    }
    for (int i = dayOfWeek - 1; i < 7; i++) {
      dat = firstDateOfMonth.add(Duration(days: i - dayOfWeek + 1));
      week.add(DateCellData(
          day: dat,
          isCurrentMonth: true,
          isWeekend: dat.isSaturday || dat.isSunday));
      weekKeys.add(LabeledGlobalKey(dat.toString()));
    }
    weeks.add(week);
    weeksKeys.add(weekKeys);
    var f = firstDateOfMonth.subtract(Duration(days: dayOfWeek - 1));
    var s = lastDateOfMonth.add(Duration(days: 7 - lastDateOfMonth.weekday));
    weeksAmount = (s.differenceInDays(f) / 7).ceil();
    for (int i = 1; i < weeksAmount; i++) {
      week = [];
      weekKeys = [];
      for (int e = 0; e < 7; e++) {
        dat = firstDateOfMonth
            .add(Duration(days: (i - 1) * 7 + e + (7 - dayOfWeek + 1)));
        week.add(DateCellData(
            day: dat,
            isCurrentMonth: dat.month == currentMonth,
            isWeekend: dat.isSaturday || dat.isSunday));
        weekKeys.add(LabeledGlobalKey(dat.toString()));
      }
      weeks.add(week);
      weeksKeys.add(weekKeys);
    }
    return [weeks, weeksKeys];
  }

  void changeMonth(DateTime month) {
    // setState(() {
    //
    // });
    generateInfo(month);
  }

  void changeYear(DateTime year) {
    // setState(() {
    //
    // });
    generateInfo(year, viewMode: DateRangePickerViewMode.month);
  }

  void changeDecade(DateTime decade) {
    // setState(() {
    //
    // });
    generateInfo(decade, viewMode: DateRangePickerViewMode.month);
  }

  void changeCentury(DateTime century) {
    // setState(() {
    //
    // });
    generateInfo(century, viewMode: DateRangePickerViewMode.decade);
  }

  void changeViewMode(DateRangePickerViewMode mode) {
    setState(() {
      viewMode = mode;
      _fadeCalendarController.reset();
      _fadeCalendarController.forward();
    });
  }

  void toSelectMode(Offset position) {
    RenderBox renderBox;
    Size cellSize;
    Offset cellPosition;
    DateCellData? dateCell;
    first:
    for (int i = 0; i < cellsKey.length; i++) {
      for (int e = 0; e < cellsKey[i].length; e++) {
        renderBox =
            cellsKey[i][e].currentContext?.findRenderObject() as RenderBox;
        cellPosition = renderBox.localToGlobal(Offset.zero);
        cellSize = cellsKey[i][e].currentContext?.size ?? Size.zero;
        if (position.dx >= cellPosition.dx &&
            position.dx <= cellPosition.dx + cellSize.width &&
            position.dy >= cellPosition.dy &&
            position.dy <= cellPosition.dy + cellSize.height) {
          dateCell = dateCells[i][e];
          break first;
        }
      }
    }
    if (dateCell != null) {
      setState(() {
        selectMode = true;
        if (selectMode) {
          firstDateSelected = dateCell!.day;
          firstDateSelectedR = firstDateSelected;
          lastDateSelected = dateCell.day;
        }
      });
    }
  }

  void tapDateCell(DateTime date) {
    switch (tapStage) {
      case _CustomRangeDatePickerTapStage.noTap:
        setState(() {
          tapStage = _CustomRangeDatePickerTapStage.tapped;
          firstDateTapped = date;
          lastDateSelected = null;
        });
        return;
      case _CustomRangeDatePickerTapStage.tapped:
        setState(() {
          tapStage = _CustomRangeDatePickerTapStage.noTap;
          firstDateSelected = firstDateTapped;
          lastDateSelected = date;
          if (firstDateSelected != null &&
              lastDateSelected != null &&
              firstDateSelected!.isAfter(lastDateSelected!)) {
            DateTime tmp = firstDateSelected!;
            firstDateSelected = lastDateSelected;
            lastDateSelected = tmp;
          }
        });
        return;
      case _CustomRangeDatePickerTapStage.secondTapped:
        return;
    }
  }

  void fromSelectMode() {
    setState(() {
      selectMode = false;
      if (firstDateSelected != null &&
          lastDateSelected != null &&
          firstDateSelected != lastDateSelected) {
        tapStage = _CustomRangeDatePickerTapStage.noTap;
      }
      if (firstDateSelected != null &&
          lastDateSelected != null &&
          firstDateSelected!.isAfter(lastDateSelected!)) {
        DateTime tmp = firstDateSelected!;
        firstDateSelected = lastDateSelected;
        lastDateSelected = tmp;
      }
    });
  }

  void setLastRangeDate(DateTime lastDate) {
    setState(() {
      if (lastDate.isBefore(firstDateTapped!)) {
        lastDateSelected = firstDateSelectedR;
        firstDateSelected = lastDate;
      } else {
        lastDateSelected = lastDate;
      }
    });
  }

  Widget viewWidget() {
    switch (viewMode) {
      case DateRangePickerViewMode.date:
        return datePickerView(context);
      case DateRangePickerViewMode.month:
        return monthPickerView(context);
      case DateRangePickerViewMode.year:
        return yearPickerView(context);
      case DateRangePickerViewMode.decade:
        return decadePickerView(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: decoration,
      child: FadeTransition(
        opacity:
            Tween<double>(begin: 0.0, end: 1.0).animate(_fadeCalendarAnimation),
        child: viewWidget(),
      ),
    );
  }

  Widget datePickerView(BuildContext context) {
    return Listener(
      onPointerDown: (det) {
        toSelectMode(det.position);
      },
      onPointerUp: (det) {
        fromSelectMode();
      },
      onPointerCancel: (det) {},
      child: SizedBox(
        width: widget.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              children: [
                ClickableWidget(
                  onTap: () {
                    changeMonth(firstDateOfMonth.previousMonth);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: cellColor,
                  ),
                ),
                ClickableWidget(
                  onTap: () {
                    changeViewMode(DateRangePickerViewMode.month);
                  },
                  child: Text(
                    '${convertMonthToString(currentMonth)} ${firstDateOfMonth.year}',
                    style: AT.body2.copyWith(color: cellColor),
                  ),
                ),
                ClickableWidget(
                  onTap: () {
                    changeMonth(firstDateOfMonth.nextMonth);
                  },
                  child: Icon(
                    Icons.chevron_right,
                    color: cellColor,
                  ),
                ),
              ],
            ),
            FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0)
                  .animate(_fadeMonthAnimation),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var day in DayOfWeek.values)
                        Center(
                          child: Text(
                            day.asString,
                            style:
                                AT.body3.copyWith(color: noSelectionCellColor),
                          ),
                        ),
                    ],
                  ),
                  for (int i = 0; i < dateCells.length; i++)
                    TableRow(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int e = 0; e < dateCells[i].length; e++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: MouseRegion(
                              onEnter: (det) {
                                if (selectMode) {
                                  setLastRangeDate(dateCells[i][e].day);
                                }
                              },
                              child: _CellInkWell(
                                onTap: () {
                                  tapDateCell(dateCells[i][e].day);
                                },
                                child: Stack(
                                  children: [
                                    if ((firstDateSelected != null &&
                                            firstDateSelected!.equalWithNoTime(
                                                dateCells[i][e].day)) &&
                                        lastDateSelected != null &&
                                        firstDateSelected != lastDateSelected)
                                      Padding(
                                        padding: widget.selectedRangeCellPadding
                                                ?.copyWith(right: 0) ??
                                            const EdgeInsets.fromLTRB(
                                                10, 5, 0, 5),
                                        child: DecoratedBox(
                                          decoration:
                                              selectedDateRangeCellDecoration,
                                          child: const Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text('1', style: AT.body3),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if ((lastDateSelected != null &&
                                            lastDateSelected!.equalWithNoTime(
                                                dateCells[i][e].day)) &&
                                        firstDateSelected != null &&
                                        firstDateSelected != lastDateSelected)
                                      Padding(
                                        padding: widget.selectedRangeCellPadding
                                                ?.copyWith(left: 0) ??
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 10, 5),
                                        child: DecoratedBox(
                                          decoration:
                                              selectedDateRangeCellDecoration,
                                          child: const Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                '1',
                                                style: AT.body3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    DecoratedBox(
                                      key: cellsKey[i][e],
                                      decoration: ((firstDateSelected != null &&
                                                  firstDateSelected!
                                                      .equalWithNoTime(
                                                          dateCells[i][e]
                                                              .day)) ||
                                              (lastDateSelected != null &&
                                                  lastDateSelected!
                                                      .equalWithNoTime(
                                                          dateCells[i][e].day)))
                                          ? selectedDateCellDecoration
                                          : widget.showPresentDate &&
                                                  presentDate.equalWithNoTime(
                                                      dateCells[i][e].day)
                                              ? presentDateCellDecoration
                                              : const BoxDecoration(),
                                      child: Padding(
                                        padding:
                                            widget.selectedRangeCellPadding ??
                                                const EdgeInsets.symmetric(
                                                    vertical: 5),
                                        child: DecoratedBox(
                                          decoration: (((firstDateSelected?.lWithNoTime(
                                                              dateCells[i][e]
                                                                  .day) ??
                                                          false) &&
                                                      (lastDateSelected?.bWithNoTime(
                                                              dateCells[i][e]
                                                                  .day) ??
                                                          false)) ||
                                                  ((lastDateSelected?.lWithNoTime(
                                                              dateCells[i][e]
                                                                  .day) ??
                                                          false) &&
                                                      (firstDateSelected
                                                              ?.bWithNoTime(dateCells[i][e].day) ??
                                                          false)))
                                              ? selectedDateRangeCellDecoration
                                              : const BoxDecoration(),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                  dateCells[i][e]
                                                      .day
                                                      .day
                                                      .toString(),
                                                  style: AT.body3.copyWith(
                                                    color: ((firstDateSelected !=
                                                                    null &&
                                                                firstDateSelected!
                                                                    .equalWithNoTime(
                                                                        dateCells[i][e]
                                                                            .day)) ||
                                                            (lastDateSelected !=
                                                                    null &&
                                                                lastDateSelected!
                                                                    .equalWithNoTime(
                                                                        dateCells[i][e]
                                                                            .day)))
                                                        ? selectedCellColor
                                                        : dateCells[i][e]
                                                                .isCurrentMonth
                                                            ? (dateCells[i][e]
                                                                    .isWeekend
                                                                ? weekendCellColor
                                                                : cellColor)
                                                            : noSelectionCellColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget monthPickerView(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              ClickableWidget(
                onTap: () {
                  changeYear(currentDate.previousYear);
                },
                child: Icon(Icons.chevron_left, color: noSelectionCellColor),
              ),
              ClickableWidget(
                onTap: () {
                  changeViewMode(DateRangePickerViewMode.year);
                },
                child: Text(
                  '$currentYear',
                  style: AT.body2.copyWith(color: cellColor),
                ),
              ),
              ClickableWidget(
                onTap: () {
                  changeMonth(currentDate.nextYear);
                },
                child: Icon(Icons.chevron_right, color: cellColor),
              ),
            ],
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              for (int i = 0; i < 4; i++)
                TableRow(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int e = 0; e < 3; e++)
                      _CellInkWell(
                        onTap: () {
                          changeMonth(DateTime(currentYear, i * 3 + e + 1));
                          changeViewMode(DateRangePickerViewMode.date);
                        },
                        child: DecoratedBox(
                          decoration: widget.showPresentDate &&
                                  presentDate.year == currentYear &&
                                  presentDate.month == i * 3 + e + 1
                              ? presentDateCellDecoration
                              : const BoxDecoration(),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                convertMonthToString(i * 3 + e + 1, true),
                                style: AT.body3.copyWith(color: cellColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget yearPickerView(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              ClickableWidget(
                onTap: () {
                  changeDecade(DateTime(currentDecade.l - 1));
                },
                child: Icon(Icons.chevron_left, color: cellColor),
              ),
              ClickableWidget(
                onTap: () {
                  changeViewMode(DateRangePickerViewMode.decade);
                },
                child: Text(
                  '${currentDecade.l} - ${currentDecade.r - 2}',
                  style: AT.body2.copyWith(color: cellColor),
                ),
              ),
              ClickableWidget(
                onTap: () {
                  changeDecade(DateTime(currentDecade.r));
                },
                child: Icon(Icons.chevron_right, color: cellColor),
              ),
            ],
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              for (int i = 0; i < 4; i++)
                TableRow(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int e = 0; e < 3; e++)
                      _CellInkWell(
                        onTap: () {
                          changeYear(DateTime(currentDecade.l + i * 3 + e));
                          changeViewMode(DateRangePickerViewMode.month);
                        },
                        child: DecoratedBox(
                          decoration: widget.showPresentDate &&
                                  presentDate.year ==
                                      currentDecade.l + i * 3 + e
                              ? presentDateCellDecoration
                              : const BoxDecoration(),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '${currentDecade.l + i * 3 + e}',
                                style: AT.body3.copyWith(
                                  color: currentDecade.l + i * 3 + e <
                                          currentDecade.r - 2
                                      ? cellColor
                                      : noSelectionCellColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget decadePickerView(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              ClickableWidget(
                onTap: () {
                  changeCentury(DateTime(currentCentury.l - 1));
                },
                child: Icon(Icons.chevron_left, color: cellColor),
              ),
              Text(
                '${currentCentury.l} - ${currentCentury.r - 2 * 10}',
                style: AT.body2.copyWith(color: cellColor),
              ),
              ClickableWidget(
                onTap: () {
                  changeCentury(DateTime(currentCentury.r));
                },
                child: Icon(Icons.chevron_right, color: cellColor),
              ),
            ],
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              for (int i = 0; i < 4; i++)
                TableRow(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int e = 0; e < 3; e++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: _CellInkWell(
                          onTap: () {
                            changeYear(
                                DateTime(currentCentury.l + (i * 3 + e) * 10));
                            changeViewMode(DateRangePickerViewMode.year);
                          },
                          child: DecoratedBox(
                            decoration: widget.showPresentDate &&
                                    presentDate.year >=
                                        currentCentury.l + (i * 3 + e) * 10 &&
                                    presentDate.year <=
                                        currentCentury.l + (i * 3 + e + 1) * 10
                                ? presentDateCellDecoration
                                : const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      '${currentCentury.l + (i * 3 + e) * 10} - ${currentCentury.l + (i * 3 + e + 1) * 10 - 1}',
                                      style: AT.body3.copyWith(
                                        color: currentCentury.l +
                                                    (i * 3 + e) * 10 <
                                                currentCentury.r - 2 * 10
                                            ? cellColor
                                            : noSelectionCellColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }
}

class _CellInkWell extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const _CellInkWell({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: MainColors.green.withOpacity(0.1),
      borderRadius: BorderRadius.circular(4),
      child: child,
    );
  }
}
