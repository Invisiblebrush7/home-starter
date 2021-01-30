// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "bootstrap-datepicker"
//= require bootstrap-datepicker



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------


function getDate(){
  console.log("Get Date");
  var today = new Date();
  var dd = String(today.getDate()).padStart(2, '0');
  var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
  var yyyy = today.getFullYear();

  today = mm + '/' + dd + '/' + yyyy;
  return today;
};


// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  // https://bootstrap-datepicker.readthedocs.io/en/latest/options.html
  // https://anrg9.wordpress.com/
  // let dates = [];
  // when user chooses dates, add to dates[]
  openTab();
  $('#datepicker').datepicker({
      startDate: getDate(),
      pickDate: true,
      pickTime: true
  });
});

function getDateEnd(){
  var today = new Date();
  var dd = String(today.getDate() + 1).padStart(2, '0');
  var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
  var yyyy = today.getFullYear();

  today = mm + '/' + dd + '/' + yyyy;
  return today;
};

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

var elem = document.querySelector('see-bundles-header');
elem.remove();

