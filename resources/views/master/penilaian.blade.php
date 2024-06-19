@extends('layouts.layout')

@section('masterShow')
menu-open
@endsection

@section('penilaianStatus')
active
@endsection

@section('content')
<!-- Modal Tambah Penilaian -->
<div class="modal modal-danger fade" id="tambah" tabindex="-1" role="dialog" aria-labelledby="Tambah Acara"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Tambah Penilaian</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('penilaian.store')}}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Acara</b></label>
                                <select type="text" name="idacara" class="form-control select2" placeholder="Acara" required>
                                    <option value="">--Pilih--</option>
                                    @foreach($acara as $unit)
                                    <option value="{{$unit->id}}">{{$unit->nama}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Kategori</b></label>
                                <input type="text" name="kategori" class="form-control" placeholder="Kategori" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Deskripsi</b></label>
                                <textarea type="text" name="deskripsi" class="form-control" placeholder="Deskripsi" required></textarea>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Modal Tambah Penilaian -->

<!-- Modal Edit Penilaian -->
<div class="modal modal-danger fade" id="sunting" tabindex="-1" role="dialog" aria-labelledby="Edit Peserta"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Edit Penilaian</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('penilaian.update', ['id'=>'0'])}}" method="POST">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Acara</b></label>
                                <select name="idacara" class="form-control select2">
                                    <option value="">--Pilih--</option>
                                    @foreach($acara as $unit)
                                    <option value="{{$unit->id}}">{{$unit->nama}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Kategori</b></label>
                                <input type="text" name="kategori" class="form-control" placeholder="Kategori" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Deskripsi</b></label>
                                <textarea name="deskripsi" class="form-control" placeholder="Deskripsi" required></textarea>
                            </div>
                        </div>
                        
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Modal Edit Penilaian -->

<!-- Modal Hapus Penilaian -->
<div class="modal modal-danger fade" id="hapus" tabindex="-1" role="dialog" aria-labelledby="Hapus Peserta"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Hapus Acara</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('penilaian.destroy', ['id'=>'0'])}}" method="POST" id="delete">
                @csrf
                @method('DELETE')
                <div class="modal-body">
                    <input type="hidden" name="id">
                    Anda Yakin Ingin Hapus Data?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Modal Hapus Penilaian -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="@if(!Auth::user())margin-left: 0; @endif">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <!-- <h1 class="m-0">Tampilan Awal</h1> -->
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Data Master</a></li>
                        <li class="breadcrumb-item active">Penilaian</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="card-title">Data Penilaian</h3>
                        </div>
                        <div class="col-md-6 text-right">
                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#tambah">Tambah</button>
                        </div>
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="table1" class="table table-bordered table-striped">
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->

@endsection

@section('script')
@include('layouts.alert')
<script>
    function edit(self){
        var $modal=$('#sunting');
        var tr = $(self).closest('tr');
        let idx = oTable.row(tr)[0]
        var data = oTable.data()[idx];
        
        $modal.find('input[name=id]').val(data['id']);
        $modal.find('select[name=idacara]').val(data['idacara']).change();
        $modal.find('input[name=kategori]').val(data['kategori']);
        $modal.find('textarea[name=deskripsi]').val(data['deskripsi']);
        
        $modal.modal('show');
    }

    function hapus(self){
        var tr = $(self).closest('tr');
        let idx = oTable.row(tr)[0]
        var data = oTable.data()[idx];

        $('#delete').find('input[name=id]').val(data['id']);
        var $modal = $('#hapus');
        $modal.modal('show');
    }

    $('.select2').select2({
        theme: 'bootstrap4',
    });
    
    $(document).ready(function(){
        oTable = $("#table1").DataTable({
            
            processing: true,
            serverSide: true,
            ajax: {type: "POST", url: '{{route("penilaian.data")}}', data:{'_token':@json(csrf_token())}},
            columns: [
                { data:'id', title:'ID', visible: false},
                { data:'idacara', title:'ID Acara', visible: false},
                { data:'kategori', title:'Kategori'},
                { data:'deskripsi', title:'Deskripsi'},
                { data:'action', title:'Aksi'},
            ],
        });
    });
</script>
@endsection