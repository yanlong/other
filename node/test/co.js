function getMAC(ipAddress) {
    return function(callback) {
        setTimeout(function() {
            callback(null, ipAddress);
        }, 100)
    }
}
co(function*() {
    var address = [
        '192.168.1.100',
        '192.168.1.101'
    ];
    var p1 =
        yield getMAC(address[0]);
    var p2 =
        yield getMAC(address[1]);
    console.log(address[0] + ' ->' + p1);
    console.log(address[1] + ' ->' + p2);
    return 'done';
})(function(err, result) {
    console.log('err: ' + err + ', result: ' + result);
});

function co(generator) {
    return function(fn) {
        var gen = generator();

        function next(err, result) {
            if (err) {
                return fn(err);
            }
            var step = gen.next(result);
            if (!step.done) {
                step.value(next);
            } else {
                fn(null, step.value);
            }
        }
        next();
    }
}