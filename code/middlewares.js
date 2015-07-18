var a = function(next) {
    console.log('a');
    next();
    console.log('aa');

}

var b = function(next) {
    console.log('b');
    next();
    console.log('bb');

}

var c = function(next) {
    console.log('c');
    next();
    console.log('cc');

}

var middlewares = [a, b, c];

~ function run(middlewares) {
    var h = middlewares.shift();
    if (h) {
        h(function() {
            run(middlewares);
        })
    }
}(middlewares);