<?php
require 'app/models/campaign.php';
class CampaignController extends BaseController{
  public static function index(){
    $campaigns = Campaign::all_for_user(self::get_user_logged_in()->id);
    View::make('campaign/index.html', array('campaigns' => $campaigns));
  }

  public static function store(){
	  $params = $_POST;
    $campaign = new Campaign(array(
      'name' => $params['name'],
      'omistaja_id' => self::get_user_logged_in()->id
    ));

    Kint::dump($params);

    $campaign->save();

    Redirect::to('/campaign');
  }
  public static function new(){
  	View::make('campaign/new.html');
  }

  public static function edit($id){
    $campaign = Campaign::find($id);
    View::make('campaign/edit.html', array('attributes' => $campaign));
  }

  public static function info($id){
    $campaign = Campaign::find($id);
    require_once 'app/models/party.php';
    $parties = Party::all_for_campaign($id);
    View::make('campaign/campaign.html', array('attributes' => $campaign, 'parties' => $parties));
  }

  public static function destroy($id) {
    Campaign::delete($id);
    Redirect::to('/campaign', array('message' => 'Tuhosit juuri kampanjan pysyvästi'));
  }
}