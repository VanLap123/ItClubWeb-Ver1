

<!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="./css/User/event.css">
 </head>
 <body>
     <div class="skin">
         <div class="fig-top">
             <img class="top-fig-content" src="./image/top.jpg" alt="">
         </div>
         <div class="tree-body">
             <div class="tree-name"><strong>Monthly Event</strong></div>             
                <?php
                    //Display Event with Current Month and default value if there is not enough event
                    include_once("connectDB.php");
                    $current_month = 4;//date('m');
                    $result = mysqli_query($conn, "SELECT * FROM event where month(date) = '$current_month'");
                    $default = mysqli_query($conn, "SELECT * FROM event where id = 0");
                    $default_row= mysqli_fetch_array($default, MYSQLI_ASSOC);
                    $num_rows = mysqli_num_rows($result);
                    $rowContent = array($default_row, $default_row, $default_row);
                    $i = 0;
                    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                        $rowContent[$i] = $row;
                        $i++;
                    }
                ?>                          
             <form action="" class="tree-form">
                 <!-- event 1 -->
                 
                 <div class="tree-form-item">
                     <div class="tree-item-child tree-image-cg">
                         <img class="tree-image" src="./image/<?php echo $rowContent[0]['img_event'];?>" alt="">
                     </div>
                     <?php echo $rowContent[0]['img_event'];?>
                 </div>
                 <div class="tree-form-item">
                     <div class="tree-item-child tree-item-cg">
                         <div class="tree-child-tag">Title: <?php echo $rowContent[0]['title'];?></div>
                         <div class="tree-child-tag">Time: <?php echo $rowContent[0]['time'];?></div>
                         <div class="tree-child-tag">Location: <?php echo $rowContent[0]['location'];?></div>
                         <div class="tree-child-tag">Description: <?php echo $rowContent[0]['description'];?></div>
                     </div>
                 </div>
                 <!-- event 2 -->
                 <div class="tree-form-item">
                     <div class="tree-item-child tree-item-cg">
                         <div class="tree-child-tag">Title: <?php echo $rowContent[1]['title'];?></div>
                         <div class="tree-child-tag">Time: <?php echo $rowContent[1]['time'];?></div>
                         <div class="tree-child-tag">Location: <?php echo $rowContent[1]['location'];?></div>
                         <div class="tree-child-tag">Description: <?php echo $rowContent[1]['description'];?></div> 
                     </div>
                 </div>
                 <div class="tree-form-item">
                     <div class="tree-item-child tree-image-cg">
                         <img class="tree-image" src="./image/<?php echo $rowContent[1]['img_event'];?>" alt="">
                     </div>                     
                 </div>

                 <!-- event 3 -->
                 <div class="tree-form-item">
                     <div class="tree-item-child tree-image-cg">
                         <img class="tree-image" src="./image/<?php echo $rowContent[2]['img_event'];?>" alt="">
                     </div>
                 </div>
                 <div class="tree-form-item">
                     <div class="tree-item-child tree-item-cg">
                         <div class="tree-child-tag">Title: <?php echo $rowContent[2]['title'];?></div>
                         <div class="tree-child-tag">Time: <?php echo $rowContent[2]['time'];?></div>
                         <div class="tree-child-tag">Location: <?php echo $rowContent[2]['location'];?></div>
                         <div class="tree-child-tag">Description:  <?php echo $rowContent[2]['description'];?></div>
                         
                     </div>
                 </div>
             </form>
         </div>
     </div>
 </body>
 </html> 