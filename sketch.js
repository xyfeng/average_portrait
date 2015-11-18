var photosCount;
var allPhotos;
var metaTable;
var allPixels;
var delaySec;

function preload() {
    metaTable = loadTable("metadata.csv", "csv", "header", function() {
        println("Loading Photos");
        loadPhotos();
    });
}

function setup() {
    createCanvas(487, 600);
    background(0);
    noStroke();
    frameRate(12);

    delaySec = 5;

    allPixels = new Array();
    for (var i = 0; i < width * height; i++) {
        append(allPixels, new Pixel(0, 0, 0));
    }
}

function draw() {
    if (frameCount <= allPhotos.length) {
        image(allPhotos[allPhotos.length - frameCount], 0, 0);
    } else if (frameCount <= allPhotos.length * 2 + delaySec & frameCount > allPhotos.length + delaySec) {
        frameRate(6);
        var one = allPhotos[frameCount - allPhotos.length - delaySec - 1];
        drawPhoto(one, frameCount - allPhotos.length - delaySec);
    }
}

function keyPressed() {
    // s key
    if (keyCode === 83) {
        saveCanvas('portrait_average', 'png');
    }
}


function loadPhotos() {
    photosCount = metaTable.getRowCount();
    console.log("Number of Photos: " + photosCount);
    allPhotos = new Array();
    var index = 0;
    for (var r = 0; r < photosCount; r++) {
        var fileName = metaTable.getString(r, 0);
        var img = loadImage(fileName);
        append(allPhotos, img);
        console.log(fileName);
    }
}

function drawPhoto(img, num) {
    loadPixels();
    img.loadPixels();
    var index, pxLoc;
    var r, g, b;
    var d = pixelDensity();
    for (var m = 0; m < width; m++) {
        for (var n = 0; n < height; n++) {
            index = width * n + m;
            pxLoc = index * 4;
            r = img.pixels[pxLoc];
            g = img.pixels[pxLoc + 1];
            b = img.pixels[pxLoc + 2];
            // loop over
            for (var i = 0; i < d; i++) {
                for (var j = 0; j < d; j++) {
                    idx = 4 * ((n * d + j) * width * d + (m * d + i));
                    pixels[idx] = pixels[idx] * (num - 1.0) / num + r / float(num);
                    pixels[idx + 1] = pixels[idx + 1] * (num - 1.0) / num + g / float(num);
                    pixels[idx + 2] = pixels[idx + 2] * (num - 1.0) / num + b / float(num);
                }
            }
        }
    }
    updatePixels();
}

function Pixel(_r, _g, _b) {
    this.r = _r;
    this.g = _g;
    this.b = _b;

    this.addColor = function(c, num) {
        this.r = this.r * (num - 1.0) / num + red(c) / float(num);
        this.g = this.g * (num - 1.0) / num + green(c) / float(num);
        this.b = this.b * (num - 1.0) / num + blue(c) / float(num);
    };

    this.getColor = function() {
        return color(this.r, this.g, this.b);
    };
}
