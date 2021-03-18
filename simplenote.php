<?php 
    // header("Access-Control-Allow-Origin: *");
    // header('Access-Control-Allow-Credentials: true');
    // header('Access-Control-Max-Age: 86400');
    require_once('connect.php');

    if(isset($_POST['process'])){
        if (isset($_POST['id'])) {
            $id = mysqli_real_escape_string($connect, $_POST['id']);
        }

        if (isset($_POST['title']) && isset($_POST['description']) && isset($_POST['date']) && isset($_POST['priority'])) {
            $title = mysqli_real_escape_string($connect, $_POST['title']);
            $description = mysqli_real_escape_string($connect, $_POST['description']);
            $date = mysqli_real_escape_string($connect, $_POST['date']);
            $priority = mysqli_real_escape_string($connect, $_POST['priority']);
        }
	    
        switch ($_POST['process']) {
            case 'create':
                $query = "INSERT INTO notes (title ,description ,date ,priority) VALUES('$title' ,'$description' ,'$date' ,'$priority')";
                break;
            case 'update':
                $query = "UPDATE notes set title='$title' ,description='$description' ,date='$date' ,priority='$priority' where id='$id'";
                break;
            case 'delete':
                $query = "DELETE FROM notes WHERE id='$id'";
                break;
            case 'read':
                
                $query = "SELECT * FROM notes";
                
                break;
            case 'readsingle':
                $query = "SELECT * FROM notes WHERE id='$id'";
                break;
            case 'countdata':
                $query = "SELECT count(*) FROM notes";
                break;
            
            default:
                # code...
                break;
        }
        
	    
        $result  = mysqli_query($connect, $query);
        
        if($_POST['process']=='readsingle' || $_POST['process']=='read'){
            if(mysqli_num_rows($result)>0){
                while($row = mysqli_fetch_assoc($result )){
                    $notes[] = $row; 
                }
            }else{
                $notes = 0;
            }
            
        }else{
            $notes = 'Success';
        }

        
        header('Content-Type: application/json');
        echo json_encode($notes);

    }
?>