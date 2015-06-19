<?

define("ENDPOINT", "http://cudv.dev.mateos.cc");

function _cudv_api_get($resource, $data) {
    $curl = curl_init(ENDPOINT."/api/v1/$resource/$data");
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    return json_decode(curl_exec($curl));
}

function _cudv_api_post($resource, $data) {
    $data = json_encode($data);
    $curl = curl_init(ENDPOINT."/api/v1/$resource");
    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_HTTPHEADER, array(
        "Content-Type: application/json",
        "Content-Length: " . strlen($data)
    ));
    return json_decode(curl_exec($curl));
}

function cudv_api_get_user($id) {
    return _cudv_api_get("users", $id);
}

function cudv_api_post_user($id, $name, $email, $location, $registered_at) {
    return _cudv_api_post("users", 
        array("cu_id" => $id, "name" => $name, "email" => $email, "location" => $location, "registered_at" => date('Y-m-d H:i:s', $registered_at)));
}

function cudv_api_get_product($id) {
    return _cudv_api_get("products", $id);
}

function cudv_api_post_product($id, $name, $sell_price) {
    return _cudv_api_post("products", array("cu_id" => $id, "name" => $name, "current_cost" => $sell_price));
}

function cudv_api_get_order() {
    return _cudv_api_get("orders", $id);
}

function cudv_api_post_order($id, $user_id, $partner, $order_type, $total_price, $products, $ordered_at = NULL) {
    $post = array(
        "cu_id" => $id,
        "user_id" => $user_id,
        "partner" => $partner,
        "order_type" => $order_type,
        "total_price" => $total_price,
        "products" => $products
    );

    if($ordered_at) {
        $post["ordered_at"] = date('Y-m-d H:i:s', $ordered_at);
    }

    return _cudv_api_post("orders", $post);
}

function cudv_api_get_donations_org($id) {
    return _cudv_api_get("donations_orgs", $id);
}

function cudv_api_post_donations_org($id, $user_id, $name, $registered_at, $budget) {
    return _cudv_api_post("donations_orgs", array("cu_id" => $id, "user_id" => $user_id, "name" => $name, "registered_at" => date('Y-m-d H:i:s', $registered_at), "budget" => $budget));
}


?>
