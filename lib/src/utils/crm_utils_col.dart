/// To create a responsive grid layout it is necessary to specify how many columns are in the grid
///
/// The default column available is twelve and you can add more
class Col {
  const Col({
    required this.width,
  });

  /// [width] is variable to define how long is the column will be set in percentage
  final double width;

  /// [zero] is default width of column with 0 px
  static const Col zero = Col(width: 0.0);

  /// [col_12] default width of column with 100 percent from current screen width
  static const Col col_12 = Col(width: 100.0);

  /// [col_11] default width of column with 91.666666 percent from current screen width
  static const Col col_11 = Col(width: 91.666666);

  /// [col_10] default width of column with 83.333333 percent from current screen width
  static const Col col_10 = Col(width: 83.333333);

  /// [col_9] default width of column with 75.0 percent from current screen width
  static const Col col_9 = Col(width: 75.0);

  /// [col_8] default width of column with 66.666667 percent from current screen width
  static const Col col_8 = Col(width: 66.666667);

  /// [col_7] default width of column with 58.333333 percent from current screen width
  static const Col col_7 = Col(width: 58.333333);

  /// [col_6] default width of column with 50.0 percent from current screen width
  static const Col col_6 = Col(width: 50.0);

  /// [col_5] default width of column with 41.666666 percent from current screen width
  static const Col col_5 = Col(width: 41.666666);

  /// [col_4] default width of column with 33.333333 percent from current screen width
  static const Col col_4 = Col(width: 33.333333);

  /// [col_3] default width of column with 25.0 percent from current screen width
  static const Col col_3 = Col(width: 25.0);

  /// [col_2] default width of column with 16.666666 percent from current screen width
  static const Col col_2 = Col(width: 16.666666);

  /// [col_1] default width of column with 8.333333 percent from current screen width
  static const Col col_1 = Col(width: 8.333333);
}
