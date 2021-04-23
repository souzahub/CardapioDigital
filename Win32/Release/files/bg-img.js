/*
    Silvio Santos
    Canal uniGUI Dev Design
    uniguidesign@gmail.com
*/

const SetBackground = function(img) {
    if (img.length > 4)
        $(".bg-img").css(
            'background-image',
            'url("/files/'+img+'")'
        );
}
