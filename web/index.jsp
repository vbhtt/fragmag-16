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
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.6/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="animate.css">

    <script src="jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.6/semantic.min.js"></script>
    <style>
        body {
            overflow: hidden;
        }

        h1 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: block;
            font-size: 60vh;
            color: darkslategrey;
        }

        video, .video {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            min-height: 100%;
            min-width: 100%;
        }

        .video {
            background: linear-gradient(to right, rgba(34,34,34,0) 50%, rgba(34,34,34,1) 100%) ;
        }

        .formbox {
            position: absolute;
            width: 30%;
            top: 50%;
            left: 100%;
            transform: translate(-100%, -50%);
        }
    </style>
    <script src="index.js"></script>
</head>
<body>

<video poster="videos\001.jpg" autoplay loop>
    <source src="videos/videvostock004.mp4" type="video/mp4">
</video>
<div class="video">
    <h1 style="display: none">Done!</h1>
</div>
<div class="formbox">
    <form id="uploadForm" class="ui form">
        <h2 class="ui top attatched inverted header">FragMag 2016
            <div class="sub header">Upload your articles here</div>
        </h2>
        <div class="ui input fluid field"><input type="text" name="name" placeholder="Name"></div>
        <div class="ui input fluid field"><input type="text" name="email" placeholder="Email"></div>
        <div class="field">
            <select id="ddl" class="ui search dropdown" name="dd1"
                    onchange="configureDropDownLists(this,document.getElementById('ddl2'))">
                <option value="">Select Year</option>
                <option value="FE">FE</option>
                <option value="SE">SE</option>
                <option value="TE">TE</option>
                <option value="BE">BE</option>
            </select>
        </div>
        <div class="field">
            <!--If selected branch is FE then the options here should be A,B,C and D-->
            <select id="ddl2" name="dd2" class="ui search dropdown">
                <option value="">Select Division</option>
            </select>
        </div>
        <div class="field">
            <select id="category" name="category" class="ui search dropdown">
                <option value="">Select Category</option>
                <option value="English">English</option>
                <option value="Technical">Technical</option>
                <option value="Hindi">Hindi</option>
                <option value="Marathi">Marathi</option>
            </select>
        </div>
        <div class="ui inverted blue button"><label for="file" class="progress button"><i class="file icon"></i>Select File</label>
            <input type="file" id="file" name="file" style="display: none"></div>
        <div class="field"><input id="submit" type="submit" style="display: none"></div>
    </form>
</div>
</body>
</html>