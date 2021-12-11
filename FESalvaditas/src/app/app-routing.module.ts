import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { FuncionarioComponent } from './components/funcionario/funcionario.component';
import { LoginComponent } from './components/login/login.component';
import { PrincipalComponent } from './components/principal/principal.component';
import { VisitaComponent } from './components/visita/visita.component';

const routes: Routes = [
  {path: '', component: PrincipalComponent },
  {path: 'login', component: LoginComponent },
  {path: 'funcionarios', component: FuncionarioComponent },
  {path: 'visita', component: VisitaComponent },
  {path: 'principal', component: DashboardComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
