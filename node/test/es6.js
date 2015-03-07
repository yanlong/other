

function* gen(i) {
    console.log(yield (i+1));
    console.log(yield (i+1));
    console.log(yield (i+1));
}

var it = gen(10);

var r = it.next();
r = it.next(10000)
