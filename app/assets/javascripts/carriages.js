$(document).ready(function () {
    $('.carriage').hide();
    let selected = $('#carriage_type').val();
    $('#' + selected).show();

    $('#carriage_type').change(function () {
        let type = $(this).val();
        $('.carriage').hide();
        $('#' + type).show();
    })
});
