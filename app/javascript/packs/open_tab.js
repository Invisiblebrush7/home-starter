openTab();


function openTab() {
  document.querySelectorAll(".tablink").forEach((tablink) => {
    tablink.addEventListener("click", (event) => {
      document.querySelectorAll(".tablink").forEach((i) => {
        i.classList.remove("active");
      });
      document.querySelectorAll(".tabcontent").forEach((tabcontent) => {
        tabcontent.style.display = "none";
      });
      event.currentTarget.classList.add ("active");
      document.getElementById(event.currentTarget.classList[1]).style.display = "block";
    })
  });
  document.querySelector("#default").click();
};
