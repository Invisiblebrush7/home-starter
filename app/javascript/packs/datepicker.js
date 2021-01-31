import "bootstrap-datepicker"
//= require bootstrap-datepicker

$('.datepicker').datepicker({
  autoclose: true,
  startDate: getDate()
});
$('.datepickerEnd').datepicker({
  autoclose: true,
  startDate: getEndDate()
});

function getDate(){
  console.log("Get Date");
  var today = new Date();
  var dd = String(today.getDate()).padStart(2, '0');
  var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
  var yyyy = today.getFullYear();

  today = mm + '/' + dd + '/' + yyyy;
  return today;
};
function getEndDate(){
  console.log("Get Date");
  var today = new Date();
  var dd = String(today.getDate() + 1).padStart(2, '0');
  var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
  var yyyy = today.getFullYear();

  today = mm + '/' + dd + '/' + yyyy;
  return today;
};
