<?php
include("conn1.php");

$stmtCombo = $con->prepare("SELECT pr.id, pr.prd_price, pr.discount_percent, pr.description, pr.prd_info, pr.primary_images,
						pr.created_by_id, pr.created_date, pr.updated_by_id, pr.updated_date, pr.prd_approval, cn.combo_name, pr.combo_id,
						wt.weight_availability AS weight,
						ct.category_name,
						pn.prd_name AS product_name,
						us.admin_username AS created_user,
						ur.admin_username AS updated_user,
						ROUND(pr.prd_price - ((pr.discount_percent / 100) * pr.prd_price), 2) AS finalAmount      
					FROM product_details pr
					LEFT JOIN prd_name_table pn ON pr.prd_name_id = pn.id
					LEFT JOIN combo_name cn ON pr.combo_id = cn.id
					LEFT JOIN weight_table wt ON pr.weight_id = wt.id
					LEFT JOIN prd_category ct ON pr.category_id = ct.id
					LEFT JOIN admin_login us ON pr.created_by_id = us.id
					LEFT JOIN admin_login ur ON pr.updated_by_id = ur.id
					WHERE pr.combo_id = 0
					ORDER BY pr.id DESC
					LIMIT 5");

$stmtCombo->execute();
$resultCombo = $stmtCombo->get_result();

if (!$resultCombo) {
    die('Could not enter data: ' . mysqli_error($con));
}

$data = array(); // Array to hold the fetched data

if ($resultCombo->num_rows > 0) {
    while ($rowCombo = $resultCombo->fetch_assoc()) {
        // Add each row to the data array
        $data[] = $rowCombo;
    }
}

// Encode the data array into JSON format
$jsonData = json_encode($data);

// Output the JSON data
echo $jsonData;
?>
