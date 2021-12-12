import { HttpClient,HttpClientModule } from '@angular/common/http'  
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class VisitaService {
  /* Se debe colocar el impor */
  private myUrl='https://localhost:44391/'
/*   private miApi='api/Visitas' */
  constructor(http:HttpClient) { }


}
