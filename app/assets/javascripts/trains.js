$(document).ready(function () {
    $('a.edit_train').click(function (e) {
        e.preventDefault();
        var train_id;
        var form;
        var title;

        train_id = $(this).data('trainId');
        form = $('#edit_train_' + train_id);
        title = $('#train_number_' + train_id);

        if (!$(this).hasClass('cancel')) {
            $(this).html('Cancel');
            $(this).addClass('cancel');
        } else {
            $(this).html('Edit');
            $(this).removeClass('cancel');
        }

        form.toggle();
        title.toggle();
    });
});
