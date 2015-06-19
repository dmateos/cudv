<?
$_SERVER['REMOTE_ADDR'] = '127.0.0.1';
define("DRUPAL_ROOT", dirname(realpath(__FILE__)));
require_once('includes/bootstrap.inc');
drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);

function import_orders() {
	$orders = db_query("SELECT txnid FROM ec_transaction");

	while($o = db_fetch_object($orders)) {
		$order = store_transaction_load($o->txnid);
		$user = user_load(array("uid" => $order->uid));
		$products = array();

		foreach($order->items as $item) {
			$node = node_load($item->nid);
			print_r($node);
			#cudv_client_d5_create_product_if_none($node);
			$products[] = $node->nid;
		}

		#$d7uid = cudv_client_d5_create_user_if_none($user);
		printf("%d\n", $d7uid);
		if(is_int($d7uid)) {
			$partner = cudv_client_d5_get_product_partner(node_load(reset($products)));
			#cudv_api_post_order($order->txnid, $d7uid, $partner, 1, $order->gross, $products, $order->created);
		}
	}
}

function import_donations_accounts() {
	$accounts = db_query("SELECT * FROM civicrm_contact cc 
						LEFT JOIN civicrm_value_1_organisation_details od ON cc.id = od.entity_id 
						LEFT JOIN civicrm_uf_match cum ON cc.id = cum.id
						LEFT JOIN users on cum.uf_id = users.uid
						WHERE contact_type = \"Organization\"");

	while($account = db_fetch_object($accounts)) {
		$user = user_load(array("uid" => $account->uid));
		$d7uid = cudv_client_d5_create_user_if_none($user);
		print_r(cudv_api_post_donations_org($account->id, $d7uid, $account->organization_name, $account->created, $account->budget));
	}
}

#import_donations_accounts();
import_orders();
?>
