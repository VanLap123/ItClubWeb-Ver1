<?php include_once('connectDB.php');
if ($_SESSION["id"] != null) {
    $id = $_SESSION["id"];
    $res = mysqli_query($conn, "SELECT * FROM users WHERE id='$id'");
    $row = mysqli_fetch_array($res, MYSQLI_ASSOC);
}
?>

<body>
    <div class="change-password">
        <form action="ChangeInfor_Pro.php?func=update" class="change-form" method="POST" name="formChangeInfor" id="formChangeInfor">
            <h1>Change User Information</h1>
            <div class="form-group">
                <input value="<?php echo $row['id']; ?>" class="form-input" type="hidden" placeholder="Fullname" id="id" name="id">
                <input value="<?php echo $row['username']; ?>" class="form-input" type="text" placeholder="Fullname" id="username" name="username">
                <p class="error"></p>
            </div>
            <div class="form-group">
                <input value="<?php echo $row['email']; ?>" class="form-input" type="text" placeholder="Email" id="email" name="email">
                <p class="error"></p>
            </div>
            <div class="form-group">
                <input value="<?php echo $row['user_date']; ?>" class="form-input" type="date" placeholder="Birthday" id="dob" name="dob">
                <p class="error"></p>
            </div>
            <div class="form-group">
                <input value="<?php echo $row['StudentID']; ?>" class="form-input" type="text" placeholder="StudentID" id="stid" name="stid">
                <p class="error"></p>
            </div>
            <div class="form-group">
                <input value="<?php echo $row['github']; ?>" class="form-input" type="text" placeholder="Github ID" id="github" name="github">
                <p class="error"></p>
            </div>
            <label class="dp-head">User Department:</label>
            <div class="dp-input">
                <select class="input-dp" name="department" id="department" placeholder="Department">
                    <?php $department = array(
                        "<option value='Font-end'>Font-end</option>",
                        "<option value='Back-end'>Back-end</option>",
                        "<option value='Design'>Design</option>",
                        "<option value='Media'>Media</option>",
                        "<option value='Network'>Network</option>"
                    ) ?>
                    <?php
                    $depart = $row['Department'];
                    switch ($depart) {
                        case "Font-end":
                            echo $department[0];
                            echo $department[1];
                            echo $department[2];
                            echo $department[3];
                            echo $department[4];
                            break;
                        case "Back-end":
                            echo $department[1];
                            echo $department[0];
                            echo $department[2];
                            echo $department[3];
                            echo $department[4];
                            break;
                        case "Design":
                            echo $department[2];
                            echo $department[1];
                            echo $department[0];
                            echo $department[3];
                            echo $department[4];
                            break;
                        case "Media":
                            echo $department[3];
                            echo $department[0];
                            echo $department[2];
                            echo $department[1];
                            echo $department[4];
                            break;
                        case "Network":
                            echo $department[3];
                            echo $department[0];
                            echo $department[2];
                            echo $department[1];
                            echo $department[4];
                            break;
                        default:
                            echo $department[3];
                            echo $department[0];
                            echo $department[2];
                            echo $department[1];
                            echo $department[4];
                            break;
                    }
                    ?>
                </select>
            </div>
            <label class="dp-head">Gender:</label>
            <div class="us-gender">
                <?php if ($row['gender'] == 'male') {
                    echo '<input type="radio" name="gender" value="male" checked> <span>Male</span>';
                    echo ' <input type="radio" name="gender" value="female"> <span>Female</span>';
                } else {
                    echo '<input type="radio" name="gender" value="male"> <span>Male</span>';
                    echo ' <input type="radio" name="gender" value="female" checked> <span>Female</span>';
                }
                ?>
            </div>
            <button type="submit" class="btn-submit" name="btnChangeInfor" id="btnChangeInfor" style="width:160px; background-color:rgb(209, 165, 20)">Change Information</button>
        </form>
    </div>


    <script src="./js/validator_all.js"></script>
    <script>
        Validator({
            form: '#formChangeInfor',
            formGroupSelector: '.form-group',
            errorSelector: '.error',
            rules: [
                Validator.isRequired('#username', 'This feild can not empty'),
                Validator.isRequired('#email', 'This feild can not empty'),
                Validator.isRequired('#stid', 'This feild can not empty'),
                Validator.isRequired('#github', 'This feild can not empty'),
            ],
            // onSubmit: function(data) {
            //     console.log(data)
            // }
        });
    </script>
</body>

</html>