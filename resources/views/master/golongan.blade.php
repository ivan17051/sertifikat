@extends('layouts.layout')

@section('title')
Data Golongan
@endsection

@section('masterStatus')
active
@endsection

@section('golonganStatus')
active
@endsection

@section('content')
<!-- Modal Tambah -->
<div class="modal fade text-left modal-borderless" id="tambah" tabindex="-1"
    role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah Data Golongan</h5>
                <button type="button" class="close rounded-pill" data-bs-dismiss="modal"
                    aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <form action="{{route('golongan.update')}}" method="POST">
            @csrf
            @method('PUT')
            <div class="modal-body">
                <div class="form-body">
                    <div class="form-group">
                        <label for="first-name-vertical">Golongan</label>
                        <input type="text" id="golongan" class="form-control"
                            name="golongan" placeholder="Golongan">
                    </div>
            
                    <div class="form-group">
                        <label for="first-name-vertical">Nama</label>
                        <input type="text" id="nama" class="form-control"
                            name="nama" placeholder="Nama" required>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light-primary" data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">Tutup</span>
                </button>
                <button type="submit" class="btn btn-success ml-1">
                    <i class="bx bx-check d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">Simpan</span>
                </button>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Tambah -->
<div class="modal fade text-left modal-borderless" id="sunting" tabindex="-1"
    role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Sunting Data Golongan</h5>
                <button type="button" class="close rounded-pill" data-bs-dismiss="modal"
                    aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <form action="{{route('golongan.update')}}" method="POST">
            @csrf
            @method('PUT')
            <div class="modal-body">
                <div class="form-body">
                    <input type="hidden" id="id" name="id">
                    <div class="form-group">
                        <label for="first-name-vertical">Golongan</label>
                        <input type="text" id="golongan" class="form-control"
                            name="golongan" placeholder="Golongan">
                    </div>
            
                    <div class="form-group">
                        <label for="first-name-vertical">Nama</label>
                        <input type="text" id="nama" class="form-control"
                            name="nama" placeholder="Nama" required>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light-primary" data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">Tutup</span>
                </button>
                <button type="submit" class="btn btn-success ml-1">
                    <i class="bx bx-check d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">Simpan</span>
                </button>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="page-heading">
  <div class="page-title">
      <div class="row">
          <div class="col-12 col-md-6 order-md-1 order-last">
              <h3>Data Golongan</h3>
              <!-- <p class="text-subtitle text-muted">For user to check they list</p> -->
          </div>
          <div class="col-12 col-md-6 order-md-2 order-first">
              <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                  <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="{{url('/')}}">Dashboard</a></li>
                      <li class="breadcrumb-item active" aria-current="page">Golongan</li>
                  </ol>
              </nav>
          </div>
      </div>
  </div>
  <section class="section">
      <div class="card">
        <div class="card-header text-right">
              <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#tambah">Tambah</button>
          </div>
          <div class="card-body">
              <table class="table table-striped" id="table1">
                  <thead>
                      <tr>
                          <th hidden>Id</th>
                          <th>Golongan</th>
                          <th>Nama</th>
                          <th style="width:100px;">Aksi</th>
                      </tr>
                  </thead>
                  <tbody>
                      @foreach($golongan as $unit)
                      <tr>
                          <td hidden>{{$unit->id}}</td>
                          <td>{{$unit->golongan}}</td>
                          <td>{{$unit->nama}}</td>
                          <td>
                            <a onclick="edit(this)" data-bs-toggle="modal" data-bs-target="#sunting" class="btn btn-sm btn-outline-warning"><i class="bi bi-pencil-square"></i></a>
                          </td>
                      </tr>
                      @endforeach
                  </tbody>
              </table>
          </div>
      </div>

  </section>
</div>
@endsection

@section('script')
@include('layouts.alert')
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);

    function edit(self){
        var $modal=$('#sunting');
        var tr = $(self).closest('tr');

        var id=tr.find("td:eq(0)").text().trim(); 
        var golongan=tr.find("td:eq(1)").text().trim();
        var nama=tr.find("td:eq(2)").text().trim(); 
        
        $modal.find('input[name=id]').val(id);
        $modal.find('input[name=golongan]').val(golongan);
        $modal.find('input[name=nama]').val(nama);
    }
</script>
@endsection