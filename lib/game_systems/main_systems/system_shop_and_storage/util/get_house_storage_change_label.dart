String getHouseStorageChangeLabel({
  required int newHouseStorage,
  required int currentHouseStorage,
}) {
  return (newHouseStorage >= currentHouseStorage)
      ? "(↑${newHouseStorage - currentHouseStorage})"
      : "(↓${currentHouseStorage - newHouseStorage})";
}
