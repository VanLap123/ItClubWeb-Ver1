<table class="table-log">
  <thead class="table-log-head">
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Card UID</th>
      <th>Date</th>
      <th>Time In</th>
      <th>Time Out</th>
      <th>Scores</th>
    </tr>
  </thead>
  <tbody class="table-log-body">
    <?php
    // $sql = "SELECT * FROM users_logs WHERE checkindate=? AND pic_date BETWEEN ? AND ? ORDER BY id ASC";
    include("connectDB.php");
    $date = date("Y-m-d");
    $sql = "SELECT * FROM users_logs WHERE checkindate='$date' ORDER BY id DESC";
    //$sql = "SELECT * FROM users_logs ORDER BY id DESC";
    if (isset($_GET['func']) && $_GET['func'] == 'filter') {
      $sql = $_GET['sql'];
      echo $sql;
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