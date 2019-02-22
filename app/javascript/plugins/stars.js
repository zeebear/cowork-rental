const starit = () => {
  const stars = document.querySelectorAll(".fa-star");
  const booking = document.getElementById("booking-id");
  const content = document.getElementById("content-review");
  stars.forEach(star => {
    star.addEventListener("click", (event) => {
      const btn = document.getElementById('btn-rating');
      btn.setAttribute('href', `/bookings/${parseInt(booking.innerText)}/reviews?rating=${star.id}&content=${content.value}`);
      for (let i = 0; i < 5; i++) {
        stars[i].classList.remove("yellow");
      }
      for (let i = 0; i <= star.id; i++) {
        stars[i].classList.add("yellow");
      }
      for (let i = star.id + 1; i < 5; i++) {
        stars[i].classList.remove("yellow");
      }
    });
  })
}

export { starit };
