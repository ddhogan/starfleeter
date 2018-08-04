function getAssignments() {

};

function postAssignment(event) {
    let myForm = document.querySelector("form")
    if (myForm) {
        myForm.onsubmit = function(event){
            event.preventDefault();
            const xhr = new XMLHttpRequest;
            const url = '/assignments';
            const data = JSON.stringify({id: '200'});

            xhr.responseType = 'json';
            xhr.onreadystatechange = () => {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    console.log(xhr.response); // code to execute with response
                }
            };
            xhr.open('POST', url);
            xhr.send(data);
        };
    };
};


window.onload = postAssignment();