

const swalInit1 = Swal.mixin({
    buttonsStyling: false
});

function showWarningmessage(message) {
    swalInit1.fire({
        title: 'Warning',
        text: message,
        icon: 'warning',
        confirmButtonText: 'OK',
        customClass: {
            confirmButton: 'btn btn-warning'
        }
    });
}

function showSuccessMessage(message) {
    swalInit1.fire({
        title: 'Success',
        text: message,
        icon: 'success',
        confirmButtonText: 'OK',
        customClass: {
            confirmButton: 'btn btn-success'
        }
    });
}

function showErrorMessage(message) {
    swalInit1.fire({
        title: 'Error',
        text: message,
        icon: 'error',
        confirmButtonText: 'OK',
        customClass: {
            confirmButton: 'btn btn-danger'
        }
    });
}

function showInfoMessage(message) {
    swalInit1.fire({
        title: 'Information',
        text: message,
        icon: 'info',
        confirmButtonText: 'OK',
        customClass: {
            confirmButton: 'btn btn-info text-white'
        }
    });
}