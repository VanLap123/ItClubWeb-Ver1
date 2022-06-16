<body style="background-color:  #0c5774;">
    <style>
        .container {
            text-align: left;
            display: flex;
            /* justify-content: center; */
            margin-top: 50px;
            min-height:400px;
        }

        .form-search {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .lable-date {
            color: #fff;
        }

        .input-search {
            height: 30px;
        }

        .btn-search-userlist {
            height: 33px;
            background-color: #CCC;
            border: 1px solid #CCC;
            border-radius: 5px;
            width: 100px;
        }
    </style>

<div class="container">
        <div class="content-block">
            <form method='POST' class="form-search">
                <label class="lable-date" for="attendantdate">Choose month:</label>
                <input class="input-search" type="month" id="checkindate" name="checkindate" placeholder="dd-mm-yyyy" value='<?php echo date('Y-m-d'); ?>'>
                <input class="btn-search-userlist" type="submit" name="search" value="Search">
            </form>
            <?php
            require 'connectDB.php';
            $us = $_SESSION["us"];
            if (isset($_POST['checkindate'])) {
                $checkindate = $_POST['checkindate'];
                $time = strtotime($checkindate);
                $month = date("m", $time);
                $year = date("Y", $time);
            } else {
                $month = date('m');
                $year = date("Y");
            }
            $sql = "select * From users_logs  where '$month' = MONTH(checkindate) AND '$year'=YEAR(checkindate) AND '$us'=username";
            $result = mysqli_query($conn, $sql);
            if (mysqli_num_rows($result) > 0) {
                echo "<table class=\"center\">
        <table border='1'>
            <tr>
            <th>Name</th>
            <th>Date</th>
            <th>Time In</th>
            <th>Time Out</th>
            <th>Scores</th>
            </tr>";
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>";
                    echo "<td>" . $row['username'] . "</td>";
                    echo "<td>" . $row['checkindate'] . "</td>";
                    echo "<td>" . $row['timein'] . "</td>";
                    echo "<td>" . $row['timeout'] . "</td>";
                    echo "<td>" . $row['scores'] . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
                mysqli_close($conn);
            } else print("0 results");
            ?>
        </div>
    </div>
    <!-- body -->
</body>

</html>