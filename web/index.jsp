<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="apple-touch-icon" sizes="57x57" href="icons/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="icons/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="icons/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="icons/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="icons/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="icons/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="icons/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="icons/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="icons/apple-touch-icon-180x180.png">
    <link rel="icon" type="image/png" href="icons/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="icons/favicon-194x194.png" sizes="194x194">
    <link rel="icon" type="image/png" href="icons/favicon-96x96.png" sizes="96x96">
    <link rel="icon" type="image/png" href="icons/android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="icons/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="icons/manifest.json">
    <link rel="mask-icon" href="icons/safari-pinned-tab.svg" color="#1f1f2f">
    <link rel="shortcut icon" href="icons/favicon.ico">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="msapplication-TileImage" content="icons/mstile-144x144.png">
    <meta name="msapplication-config" content="icons/browserconfig.xml">
    <meta name="theme-color" content="#1f1f2f">
    <title>FragMag 2016</title>
    <link rel="stylesheet" type="text/css" href="semantic-ui/semantic.css">

    <script src="jquery.min.js"></script>
    <script src="semantic-ui/semantic.min.js"></script>
    <style>
        body {
            background: url("images/google-earth-view-6069.jpg");
        }
    </style>
    <script>
        $(function () {
            $('select.dropdown')
                    .dropdown()
            ;
        });
        function configureDropDownLists(ddl1,ddl2) {
            var fe = ['A', 'B', 'C', 'D'];
            var shapes = ['Computers', 'Electronics', 'Production', 'IT'];

            switch (ddl1.value) {
                case 'FE':
                    ddl2.options.length = 0;
                    for (i = 0; i < fe.length; i++) {
                        createOption(ddl2, fe[i], fe[i]);
                    }
                    break;
                case 'SE':
                case 'TE':
                case 'BE':
                    ddl2.options.length = 0;
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
    </script>
</head>
<body>
<div class="ui center aligned grid">
    <div class="ui stacked raised segment">
        <div class="four wide column">
            <form class="ui large form">

                <h2 class="ui top attatched header">FragMag 2016
                    <div class="sub header">Upload your articles here</div>
                </h2>
                <div class="field"><input type="text" placeholder="Name"></div>
                <div class="field">
                    <select id="ddl" class="ui search dropdown" onchange="configureDropDownLists(this,document.getElementById('ddl2'))">
                        <option value="">Select Year</option>
                        <option value="FE">FE</option>
                        <option value="SE">SE</option>
                        <option value="TE">TE</option>
                        <option value="BE">BE</option>
                    </select>
                </div>
                <div class="field">
                    <!--If selected branch is FE then the options here should be A,B,C and D-->
                    <select id="ddl2" class="ui search dropdown">
                    </select>
                </div>
                <div class="field"><label for="file" class="ui inverted violet icon button">
                    <i class="file icon"></i>
                    Select File</label>
                    <input type="file" id="file" style="display:none"></div>
                <div class="field"><input type="submit" class="ui inverted violet fluid button"></div>
            </form>
        </div>
    </div>
</div>
</body>
</html>