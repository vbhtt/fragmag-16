$(function () {
    $('select.dropdown')
        .dropdown()
    ;
    $("#progress").hide();
    $("#uploadForm").submit(function (e){
        e.preventDefault();
        e.stopPropagation();
        $("#progress").show();
        var fd = new FormData($(this)[0]);
        console.log("uploading!");
        $.ajax({
            xhr: function()
            {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt){
                        var percentComplete = evt.loaded / evt.total *100;
                        $('#progress').progress({percent: percentComplete});
                        console.log(percentComplete);
                }, false);
                return xhr;
            },
            type: 'POST',
            url: "/upload",
            data: fd,
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function(data){
                console.log("Success "+data);
            }
        });
    });
    $('#file').on('change',function(e){
        console.log(e.target.value);
        $(".progress.button").html('Submit: '+e.target.value.substr(e.target.value.lastIndexOf('/')+1));
        $(".progress.button").attr("for","submit");
    });
});
function configureDropDownLists(ddl1,ddl2) {
    var fe = ['A', 'B', 'C', 'D'];
    var shapes = ['Computers', 'Electronics', 'Production', 'IT'];

    ddl2.options.length = 0;
    var opt = document.createElement('option');
    opt.value = "";
    opt.text = "Select Division";
    opt.selected=true;
    opt.disabled=true;
    ddl2.options.add(opt);
    console.log(opt)
    switch (ddl1.value) {
        case 'FE':
            for (i = 0; i < fe.length; i++) {
                createOption(ddl2, fe[i], fe[i]);
            }
            break;
        case 'SE':
        case 'TE':
        case 'BE':
            for (i = 0; i < shapes.length; i++) {
                createOption(ddl2, shapes[i], shapes[i]);
            }
            break;
        default:
            ddl2.options.length = 0;
            break;
    }

}

function createOption(ddl, text, value) {
    var opt = document.createElement('option');
    opt.value = value;
    opt.text = text;
    ddl.options.add(opt);
}