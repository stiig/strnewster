window.addEventListener("turbolinks:load", () => {
    $('.datepicker').datepicker({
        format: "dd.mm.yyyy",
        language: "ru",
        todayBtn: "linked"
    });
})
