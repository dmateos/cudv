<?

function cudv_client_post($resource, $data) {
    $data = json_encode($data);
    $curl = curl_init("http://cudv.dev.mateos.cc/api/v1/$resource");
    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_HTTPHEADER, array(
        "Content-Type: application/json",
        "Content-Length: " . strlen($data)
    ));
    return json_decode(curl_exec($curl));
}

function cudv_client_get($resource, $data) {
    $curl = curl_init("http://cudv.dev.mateos.cc/api/v1/$resource");
    return json_decode(curl_exec($curl));
}

function cudv_client_get_user($id) {
    return cudv_client_get("users", array("id" => $id));
}

function cudv_client_post_user($id, $name, $email, $location) {
    cudv_client_post("users", array("cu_id" => $id, "name" => $name, "email" => $email, "location" => $location));
}

function cudv_client_get_product($id) {
    return cudv_client_get("products", array("id" => $id));
}

function cudv_client_post_product($id, $name, $sell_price) {
    cudv_client_post("products", array("cu_id" => $id, "name" => $name, "current_cost" => $sell_price));
}

function cudv_client_get_order() {

}

function cudv_client_post_order() {

}


?>
