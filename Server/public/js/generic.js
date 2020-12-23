function queryDB(sql, callback) {
  $.post("/query", sql, callback);
}
