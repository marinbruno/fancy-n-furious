const calculate = () => {
  const calculate_total = () => {
    const date1 = new Date(document.getElementById('booking_start_date').value);
    const date2 = new Date(document.getElementById('booking_end_date').value);
    console.log(date1);
    console.log(date2);
    if (date1 || date2) {
      let diffDays = Math.round((date2-date1)/(1000*60*60*24));
      if (diffDays < 1) { diffDays = 1 };
      console.log(diffDays);
      console.log(document.getElementById('daily_amount').value);
      document.getElementById('booking_total_amount').value = diffDays * document.getElementById('daily_amount').value;
    }
  };

  document.getElementById('booking_total_amount').value = document.getElementById('daily_amount').value;
  document.getElementById("booking_start_date").addEventListener("change", calculate_total);
  document.getElementById("booking_end_date").addEventListener("change", calculate_total);

}
export { calculate };



