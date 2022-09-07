class UserFields {
  static final String id = 'Meter ID';
  static final String folio = 'Folio';
  static final String meter = 'Meter';
  static final String consumer = 'Consumer';
  static final String reading = 'Current Reading';
  static final String path1 = 'Pic 1 Path';
  static final String path2 = 'Pic 2 Path';

  static List<String> getFields() =>
      [id, folio, meter, consumer, reading, path1, path2];
}
