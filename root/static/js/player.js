// Xstream Video Player functions

// called by the player when a related video is clicked in the flash end screeen
function videoChanged(id) {
    if (id == xsconf.mediaId) {
        $("#ABCTVViserDeg")[0].seek(0);
    }
    else {
        window.location.replace("/"+id);
    }
}

// starts a video at given offset
function goto_offset(offset) {
    $("#ABCTVViserDeg")[0].seek(offset);
}

