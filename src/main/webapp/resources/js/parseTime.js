const parseTime = dt => {
  let min = 60 * 1000;
  let c = new Date()
  let d = new Date(dt);
  let minsAgo = Math.floor((c - d) / (min));

  let formatted = '';

  if (minsAgo <= 1) {
    formatted = '방금 전'
  } else if (minsAgo < 60) { // 1시간 내
    formatted = minsAgo + '분 전';
  } else if (minsAgo < 60 * 24) { // 하루 내
    formatted = Math.floor(minsAgo / 60) + '시간 전';
  } else if (minsAgo < 60 * 24 * 3) { // 하루 이상 3일 미만
    formatted = Math.floor(minsAgo / 60 / 24) + '일 전';
  } else {
    return d.getFullYear() + '.' + (d.getMonth() + 1) + '.' + d.getDate();
  }

  return formatted;
};