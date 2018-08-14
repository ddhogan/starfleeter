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
    shipList.innerHTML = "<h3>The Fleet</h3>";
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
    let moreInfo = document.querySelector("#moreInfo");
    const request = new XMLHttpRequest();
    const requestUrl = "/ships/"+`${shipId}`;
    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        let ship = new Ship(request.response);
        moreInfo.innerHTML = '<br><h3>Additional Information for '+ship.name+'</h3><p><strong>Complement: </strong>'+ship.complement+', <strong>Note: </strong>'+ship.note+'</p>';
        crewUl = document.createElement("ul")
        moreInfo.appendChild(crewUl);

        addLink = document.createElement("a");
        addLink.innerHTML = '<a href="/assignments">Manage Assignments</a>';

        if (ship.crews.length > 0) {
            ship.crews.forEach(function(crew) {
                crewLi = document.createElement("li")
                crewLi.innerHTML = '<li><strong>Assigned Crew: </strong>' +crew.name +'</li>';
                crewUl.appendChild(crewLi);
            });
            moreInfo.appendChild(addLink);
        } else {
            crewLi = document.createElement("li")
            crewLi.innerHTML = '<li>There are no crew members currently assigned to '+ship.name+'.</li>';
            crewUl.appendChild(crewLi);
            moreInfo.appendChild(addLink);
        }
    };
};