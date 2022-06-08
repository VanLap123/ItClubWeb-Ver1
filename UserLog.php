<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="./css/User/LogIn.css">
    <link rel="stylesheet" href="./css/User/index.css">
    <link rel="stylesheet" href="./css/User/ManageUser.css">
    <link rel="stylesheet" href="./css/User/userlog.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UserLog</title>

    <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha1256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
    </script>
    <script type="text/javascript" src="js/bootbox.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script src="./js/user_log.js"></script>
    <script>
        $(window).on("load resize ", function() {
            var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
            $('.tbl-header').css({
                'padding-right': scrollWidth
            });
        }).resize();
    </script>
    <script>
        $(document).ready(function() {
            $.ajax({
                url: "user_log_up.php",
                type: 'POST',
                data: {
                    'select_date': 1,
                }
            }).done(function(data) {
                $('#userslog').html(data);
            });

            setInterval(function() {
                $.ajax({
                    url: "user_log_up.php",
                    type: 'POST',
                    data: {
                        'select_date': 0,
                    }
                }).done(function(data) {
                    $('#userslog').html(data);
                });
            }, 5000);
        });
    </script>
</head>
<!-- end body -->
<?php
include_once("connectDB.php");
?>
<!-- body -->
<div class="log-container">
    <div class="log-header">
        <div class="log-label">
            <p>User Daily Logs</p>
        </div>
        <div class="btn-export js-btn-export">
            <button>Log Filter/ Export to Excel</button>
        </div>
    </div>
    <?php
    if (isset($_GET['func']) && $_GET['func'] == 'filter') { ?>
        <table class="table-log">
            <thead class="table-log-head">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Card UID</th>
                    <th>Date</th>
                    <th>Time In</th>
                    <th>Time Out</th>
                    <th>Score</th>
                </tr>
            </thead>
            <tbody class="table-log-body">
                <?php
                // $sql = "SELECT * FROM users_logs WHERE checkindate=? AND pic_date BETWEEN ? AND ? ORDER BY id ASC";
                include("connectDB.php");
                $sql = "SELECT * FROM users_logs ORDER BY id DESC";
                if (isset($_GET['func']) && $_GET['func'] == 'filter') {
                    $sql = $_GET['sql'];
                }
                $resultl = mysqli_query($conn, $sql);
                while ($row = mysqli_fetch_array($resultl, MYSQLI_ASSOC)) {
                ?>
                    <TR>
                        <TD><?php echo $row['id']; ?></TD>
                        <TD><?php echo $row['username']; ?></TD>
                        <TD><?php echo $row['card_uid']; ?></TD>
                        <TD><?php echo $row['checkindate']; ?></TD>
                        <TD><?php echo $row['timein']; ?></TD>
                        <TD><?php echo $row['timeout']; ?></TD>
                        <TD><?php echo $row['scores']; ?></TD>
                    </TR>
                <?php
                }
                ?>
            </tbody>
        </table>
    <?php } else { ?>
        <div id="userslog" style="display:flex; justify-content:center;">
        </div>
    <?php } ?>
</div>

<!--modal filter  -->
<div class="modal-filter js-modal-filter">
    <div class="md-filter-container js-modal-container-filter">
        <form action="Export_Excel.php" method="POST">
            <div class="filter-header">
                <h2 class="head-label">Filter Your User Log</h2>
                <i class="filter-close js-modal-filter-close">X</i>
            </div>
            <div class="filter-body">
                <div class="filter-body-cover">
                    <div class="body-left">
                        <div class="left-head">
                            <p class="box-label">Filter By Date:</p>
                        </div>
                        <div class="left-right-body">
                            <label for="datestart">Select from this Date:</label>
                            <input name="date_sel_start" id="date_sel_start" type="date" class="date" id="datestart">
                            <label for="dateend">To end of this Date:</label>
                            <input name="date_sel_end" id="date_sel_end" type="date" class="date" id="dateend">
                        </div>
                    </div>
                    <div class="body-right">
                        <div class="right-head">
                            <p class="box-label">Filter By Time:</p>
                            <input class="time-in" type="radio" id="radio-one" name="time_sel" class="time-in" value="Time_in">Time-In</input>
                            <input class="time-in" type="radio" id="radio-two" name="time_sel" class="time-out" value="Time_out">Time-Out</input>
                        </div>
                        <div class="left-right-body">
                            <label for="timein">Select from this Time:</label>
                            <input type="time" class="time" name="time_sel_start" id="time_sel_start">
                            <label for="timeout">To end of this Time:</label>
                            <input type="time" class="time" name="time_sel_end" id="time_sel_end">
                        </div>
                    </div>
                </div>
                <div class="body-bottom">
                    <div class="filter-1">
                        <label for="">Filter By User</label>
                        <select class="filter-select" placeholder="User" name="card_sel" id="card_sel">
                            <option value="0">All User</option>
                            <?php
                            require 'connectDB.php';
                            $sql = "SELECT * FROM users ORDER BY id ASC";
                            $result = mysqli_stmt_init($conn);
                            if (!mysqli_stmt_prepare($result, $sql)) {
                                echo '<p class="error">SQL Error</p>';
                            } else {
                                mysqli_stmt_execute($result);
                                $resultl = mysqli_stmt_get_result($result);
                                while ($row = mysqli_fetch_assoc($resultl)) {
                            ?>
                                    <option value="<?php echo $row['card_uid']; ?>"><?php echo $row['username']; ?></option>
                            <?php
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div class="filter-1">
                        <label for="">Filter By Department</label>
                        <select class="filter-select" placeholder="Department" name="dev_sel" id="dev_sel">
                            <option value="0">All Department</option>
                            <?php
                            require 'connectDB.php';
                            $sql = "SELECT * FROM devices ORDER BY device_dep ASC";
                            $result = mysqli_stmt_init($conn);
                            if (!mysqli_stmt_prepare($result, $sql)) {
                                echo '<p class="error">SQL Error</p>';
                            } else {
                                mysqli_stmt_execute($result);
                                $result1 = mysqli_stmt_get_result($result);
                                while ($row = mysqli_fetch_assoc($result1)) {
                            ?>
                                    <option value="<?php echo $row['device_uid']; ?>"><?php echo $row['device_dep']; ?></option>
                            <?php
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div class="filter-2">
                        <label for="">Export to excel</label>
                        <button type="submit" name="To_Excel" class="export">Export</button>
                    </div>
                </div>
            </div>
            <div class="filter-footer">
                <div class="footer-btn">
                    <button onclick="return confirm('Are you sure ?')" type="submit" class="btn-cancel" name="btn_delete" id="btn-delete">Delete</button>
                    <button type="submit" class="btn-filter" name="user_log" id="user_log">Filter</button>
                    <button type="reset" class="btn-cancel">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- end modal filter -->
<script>
    const filterLogs = document.querySelectorAll('.js-btn-export') //sellect the class use to use js
    const closeFilter = document.querySelector('.js-modal-filter-close')
    const modalFilter = document.querySelector('.js-modal-filter')
    const modalcontainerFilter = document.querySelector('.js-modal-container-filter')

    function showFilter() {
        modalFilter.classList.add('open')
    }

    for (const filterLog of filterLogs) {
        filterLog.addEventListener('click', showFilter)
    }

    function hideModalAdd() {
        modalFilter.classList.remove('open')
    }
    closeFilter.addEventListener('click', hideModalAdd)

    modalFilter.addEventListener('click', hideModalAdd)

    modalcontainerFilter.addEventListener('click', function(event) {
        event.stopPropagation() //stop nổi bọt
    })
</script>
</body>

</html>
