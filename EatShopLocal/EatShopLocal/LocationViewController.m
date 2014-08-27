#import "LocationViewController.h"

@interface LocationViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) MKCircle *circleOverlay;
@end

@implementation LocationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone; //whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest; //100 m
    //Start the location manager, then only updates the current location
    
    [self.locationManager startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKPointAnnotation*    annotation = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D myCoordinate;
    myCoordinate.latitude=userLocation.location.coordinate.latitude;
    myCoordinate.longitude=userLocation.location.coordinate.longitude;
    annotation.coordinate = myCoordinate;
    [self.mapView addAnnotation:annotation];
}

@end
