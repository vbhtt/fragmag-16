<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
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
        })
    </script>
</head>
<body>
<div class="ui center aligned grid">
    <div class="ui stackable segment">
    <div class="four wide column">
            <form class="ui form">

                <h2 class="ui top attatched header">FragMag 2016
                    <div class="sub header">Upload your articles here</div>
                </h2>
                <div class="field"><input type="text" placeholder="Name"></div>
                        <div class="field">
                            <select class="ui search dropdown">
                                <option value="">Select Year</option>
                                <option value="1">FE</option>
                                <option value="2">SE</option>
                                <option value="3">TE</option>
                                <option value="4">BE</option>
                            </select>
                        </div>
                        <div class="field">
                            <!--If selected branch is FE then the options here should be A,B,C and D-->
                            <select class="ui search dropdown">
                                <option value="">Select Branch</option>
                                <option value="1">Computers</option>
                                <option value="2">Electronics</option>
                                <option value="3">Production</option>
                                <option value="4">IT</option>
                            </select>
                        </div>
                    <div class="field"><label for="file" class="ui blue basic icon button">
                        <i class="file icon"></i>
                        Select File</label>
                        <input type="file" id="file" style="display:none"></div>
                    <div class="field"><input type="submit" class="ui blue basic fluid button"></div>
            </form>
        </div>
    </div>
</div>
</body>
</html>