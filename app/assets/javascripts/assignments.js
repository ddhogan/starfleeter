function getAssignments() {

};

function postAssignment(event) {
    let myForm = document.querySelector("form")
    if (myForm) {
        myForm.onsubmit = function(event){
            event.preventDefault();
            alert("I am a hack3r");
            console.log("I am a hack3r");
        };
    }
};


window.onload = postAssignment();