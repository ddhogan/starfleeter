class Assignment {
    constructor(assignmentJson) {
        this.id = assignmentJson.id;
        this.name = assignmentJson.name;
        this.description = assignmentJson.description;
        this.ship_id = assignmentJson.ship_id;
        this.crew_id = assignmentJson.crew_id;
    };
};

function getAssignments() {

};

function postAssignment(event) {
    let myForm = document.querySelector("form")
    if (myForm) {
        myForm.onsubmit = function(event){
            event.preventDefault();

            const xhr = new XMLHttpRequest;
            const url = '/assignments';
            let data = {
                name: document.querySelector("#assignment_name").value,
                description: document.querySelector("#assignment_description").value,
                ship_id: document.querySelector("#assignment_ship_id").value,
                crew_id: document.querySelector("#assignment_crew_id").value
                
            };
            xhr.responseType = 'json';
            xhr.onreadystatechange = () => {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    console.log("did this work?"); // code to execute with response
                    console.log(xhr.response);
                }
            };
            xhr.open('POST', url);
            xhr.send(data);
        };
    };
};


window.onload = postAssignment();