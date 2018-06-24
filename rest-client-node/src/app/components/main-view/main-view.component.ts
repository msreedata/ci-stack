import {Component, OnInit, Inject, ViewChild} from "@angular/core";
import {ActivatedRoute, Router} from "@angular/router";
import { ToastrService } from 'ngx-toastr';
import {Observable} from "rxjs/Rx";
import {GetComponent} from "./get/get.component";
import { HttpClient } from '@angular/common/http';
import { HttpClientModule } from '@angular/common/http'; 
import { Http,Response } from '@angular/http'

@Component({
  selector: 'app-main-view',
  templateUrl: './main-view.component.html',
  styleUrls: ['./main-view.component.scss']
})
export class MainViewComponent implements OnInit {

  @ViewChild(GetComponent) private getComponent: GetComponent;
  popupState: string = null;

  pageData: any = null;
  private versionInfo: any = null;

  config: any = {};

  selectedRow: any = {};

  constructor(@Inject('RequestsService') private requestsService,
              @Inject('ConfigurationService') private configurationService,
              @Inject('DataPathUtils') private dataPathUtils,
              @Inject('UrlUtils') private urlUtils,
              private route: ActivatedRoute,
              private router: Router,
              private toastrService: ToastrService,
              private http: Http) {

                console.log('pg.1*********');
  }

  ngOnInit() {
    this.configurationService.getConfiguration().subscribe((config: any) => {
      if (!config || !config.pages) {
        return;
      }
      this.config = config;
      this.route.params.map((p: any) => p.pageId).subscribe(pageId => {
        this.getPageData(pageId);
      });
    });

    //this.versionInfo = "on init set"

    
    
  }

  private getPageData(pageId) {
    this.pageData = null;



    if (!pageId) {
      this.pageData = this.config.pages.filter(page => page.default)[0];

      if (!this.pageData) {
        this.pageData = this.config.pages[0];
      }

      this.router.navigate([this.pageData.id]);
      this.pageData.version = "someVersion1"
      return;
    }
    else {
      this.pageData = this.config.pages.filter(page => page.id === pageId)[0];

      this.getServiceVersion();
      //this.pageData.version = "someVersion2"
    }

    if (!this.pageData) {
      this.toastrService.error(`No page found with id ${pageId}`, 'Error');
      this.pageData.version = "someVersion3"
      return;
    }
  }



  public getServiceVersion() {

    let profileResponse;

    this.http.get(`http://lindoce02:5000/api/v2/Foods`).subscribe((response) => {
      this.pageData.version = response;
    });
    
    
   // this.versionInfo = profileResponse
   // return this.versionInfo;
  }
  // public getServiceVersion() {
    
  //   if (!this.pageData.methods.getAll) {
  //     return "";
  //   }

  //   if(!this.versionInfo){
  //     const getMethod = this.pageData.methods.getAll;
  //     let getUrl = getMethod.url;
  //     if (getUrl) {
  //       getUrl=getUrl.replace('/api/v1/' , '/api/v2/')
  //     }

  //     const dataPath = getMethod.dataPath;
  //     //replace base url with pageData url
      
  //     getUrl = this.urlUtils.getParsedUrl(getUrl, null, null,this.pageData.urlHost);

  //     console.log('Get single url', getUrl);

  //   //   this.http.get(getUrl)
  //   //               .subscribe(result => this.versionInfo =result.text());

  //   //  //      
  //   this.versionInfo = this.http.get(getUrl).map((res:Response) => res.text());
  //   //.subscribe(response => this.versionInfo = response.text())
  //   //this.http.request(getUrl).subscribe(testReadme => this.versionInfo = testReadme.text());

  //   }

  //   return this.versionInfo;

  // }

  private getRowData(defaultData = {}) {
    if (!this.pageData.methods.getSingle) {
      return Observable.of(defaultData);
    }

    const getMethod = this.pageData.methods.getSingle;
    let getUrl = getMethod.url;
    if (!getUrl) {
      return Observable.of(defaultData);
    }

    const dataPath = getMethod.dataPath;
    //replace base url with pageData url
    
    getUrl = this.urlUtils.getParsedUrl(getUrl, defaultData, dataPath,this.pageData.urlHost);

    console.log('Get single url', getUrl);

    let actualMethod = this.requestsService.get.bind(this.requestsService);
    const actualMethodType = this.pageData.methods.getSingle.actualMethod;
    if (actualMethodType && this.requestsService[actualMethodType]) {
      actualMethod = this.requestsService[actualMethodType].bind(this.requestsService);
    }

    return actualMethod(getUrl);
  }

  public showPopup(e: any = {}) {
    this.popupState = e.state || null;
    switch (this.popupState) {
      case 'put':
        this.getRowData(e.data || {}).subscribe((res) => {
          console.log('Single item data', res);
          this.selectedRow = res;
        }, (e) => {
          console.error(e);
          this.toastrService.error(e, 'Error');
          this.selectedRow = e.data || {};
        });
        break;
      case 'afterChange':
        this.getComponent.firstRequest();
        break;
      default:
        this.selectedRow = {};
    }
  }


}
