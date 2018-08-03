class Ship {
    constructor(shipJson) {
        this.id = shipJson.id;
        this.name = shipJson.name;
        this.typeClass = shipJson.type_class;
        this.warpFactor = shipJson.warp_factor;
        this.complement = shipJson.complement;
        this.note = shipJson.note;
        this.crews = shipJson.crews;
    };
};

function getShips() {
    let shipList = document.querySelector("#listArea");
    let shipUl = document.createElement("ul");
    shipUl.setAttribute("id", "shipList");
    shipList.innerHTML = "<h4>The Fleet</h4>";
    shipList.appendChild(shipUl);

    // clear out the moreInfo section
    let moreInfo = document.querySelector("#moreInfo");
    moreInfo.innerHTML = '<p></p>';

    const requestUrl = "/ships";
    const request = new XMLHttpRequest();

    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        request.response.forEach(function(item) {
            let ship = new Ship(item);
            let shipLi = document.createElement("li");
            shipLi.innerHTML = 'Name: <a href="#" onclick="getShipInfo(' + ship.id + ');">' + ship.name + '</a>, Class: ' + ship.typeClass + ', Warp Factor: ' + ship.warpFactor + '<br> <div id="moreInfoSpot"></div>';
            shipUl.appendChild(shipLi);
        });
    };
};

function getShipInfo(shipId) {
    let shipList = document.querySelector("#shipList");
    let moreInfo = document.querySelector("#moreInfo");
    
    const request = new XMLHttpRequest();
    const requestUrl = "/ships/"+`${shipId}`;
    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        let ship = new Ship(request.response);
        moreInfo.innerHTML = '<br><h5>Additional Information for '+ship.name+'</h5><p><strong>Complement: </strong>'+ship.complement+', <strong>Note: </strong>'+ship.note+'</p>';
        assignedCrew = document.createElement("p")
        if (ship.crews.length > 0) {
            ship.crews.forEach(function(crew) {
                assignedCrew.innerHTML = '<p><strong>Assigned Crew: </strong>' +crew.name +'</p>';
            });
        } else {
            assignedCrew.innerHTML = '<p>There are no crew members currently assigned to '+ship.name+'</p>';
        }
        moreInfo.appendChild(assignedCrew);
    };
};