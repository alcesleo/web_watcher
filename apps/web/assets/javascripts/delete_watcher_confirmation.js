var deleteButtonForm = document.getElementById("watcher-form");

deleteButtonForm.addEventListener("submit", function(e) {
    if (!confirm("Delete this watcher and all collected data?")) {
        e.preventDefault();
        return false;
    }
}, false);
