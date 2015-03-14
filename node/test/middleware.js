var mws = [];

mws.push(function*(next) {

    console.log('M1 begin.')

    yield next;

    console.log('M1 end.');
})

mws.push(function*(next) {

    console.log('M2 begin.')

    yield next;

    console.log('M2 end.');
})
mws.push(function*(next) {

    console.log('M3 begin.')


    console.log('M3 end.');
})

var current = 0;

function next() {
    if (current < mws.length) {
        var gen = mws[current++](next);
        // var ret = gen.next();
        for (var value of gen) {
            value();
        }
    }
}
next();