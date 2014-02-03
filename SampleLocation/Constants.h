//
//  Constants.h
//  SampleLocation
//
//  Created by Choudhury, Apratim on 9-12-13.
//  Copyright (c) 2013 Apro. All rights reserved.
//

//4SQ seach URL
#define kFSSearchURL @"https://api.foursquare.com/v2/venues/search?client_id=RIQEPK5MKNGUAUGA4DOK2AW20WZNRF1J2HWHHR2DZOLQQQN4&client_secret=RH0YMUKU1PBFNFHCCIPTO2RB0KTU2VS0CSHUMEVOZ4QT1NRU%20&v=20130815&limit=25"

//4SQ Venue addition URL
#define kFSAddURL @"https://api.foursquare.com/v2/venues/add?v=20130815&oauth_token="

//Location found notication constant
#define kLocationFound @"kLocationFound"

//4SQ Client ID
#define kFSClientID @"RIQEPK5MKNGUAUGA4DOK2AW20WZNRF1J2HWHHR2DZOLQQQN4"

//4SQ client secret
#define kFSClientSecret @"RH0YMUKU1PBFNFHCCIPTO2RB0KTU2VS0CSHUMEVOZ4QT1NRU"

//Redirect URL for App - also registered through plist
#define kFSRedirectURI @"sampleLocation://foursquare"

//
#define kNumOfFields 5 + 1

//GPS distance filter in m.
#define kGPSDistanceFilter 5