class Ship {
    constructor(shipJson) {
        this.id = shipJson.id;
        this.name = shipJson.name;
        this.typeClass = shipJson.type_class;
        this.warpFactor = shipJson.warp_factor;
        this.complement = shipJson.complement;
        this.note = shipJson.note;
    };
};

function getShips() {
    $.getJSON("/ships", function(item) {
        $.forEach(function(item) {
            let ship = new Ship(item);
            let shipLi = document.createElement("li");
            shipLi.textContent = ship.name;
            $("#ships_list").appendChild(shipLi);
        });
    });
};