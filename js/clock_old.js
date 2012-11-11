var Clock = function() {
    this.foo = function() {

        $(".clock tr:nth-child(1) td:nth-child(1), .clock tr:nth-child(2) td:nth-child(1)").addClass("active");
    }

    var getItems = function(items) {
        var string = ""
        for(i = 0; i < items.length; ++i) {
            string
        }
    }
}

$(document).ready(function() {
    var clock = new Clock();

    clock.foo();
});