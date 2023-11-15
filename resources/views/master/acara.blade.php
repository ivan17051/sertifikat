@extends('layouts.layout')

@section('masterShow')
menu-open
@endsection

@section('acaraStatus')
active
@endsection

@section('content')
<!-- Modal Tambah Peserta -->
<div class="modal modal-danger fade" id="tambah" tabindex="-1" role="dialog" aria-labelledby="Tambah Acara"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Tambah Acara</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('acara.store')}}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Nama</b></label>
                                <input type="text" id="nama" name="nama" class="form-control" placeholder="Nama Acara" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Kategori</b></label>
                                <input type="text" id="kategori" name="kategori" class="form-control" placeholder="Kategori" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Tempat Mulai</b></label>
                                <input type="date" id="tgl_mulai" name="tgl_mulai" class="form-control" placeholder="Tanggal Mulai" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Tanggal Selesai</b></label>
                                <input type="date" id="tgl_selesai" name="tgl_selesai" class="form-control" placeholder="Tanggal Selesai" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Tempat</b></label>
                                <input type="text" id="tempat" name="tempat" class="form-control" placeholder="Tempat Acara">
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
<!-- End Modal Tambah Acara -->

<!-- Modal Edit Peserta -->
<div class="modal modal-danger fade" id="sunting" tabindex="-1" role="dialog" aria-labelledby="Edit Peserta"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Edit Peserta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('acara.update', ['id'=>'0'])}}" method="POST">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Nama</b></label>
                                <input type="text" id="nama" name="nama" class="form-control" placeholder="Nama Acara" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Kategori</b></label>
                                <input type="text" id="kategori" name="kategori" class="form-control" placeholder="Kategori" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Tempat Mulai</b></label>
                                <input type="date" id="tgl_mulai" name="tgl_mulai" class="form-control" placeholder="Tanggal Mulai" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Tanggal Selesai</b></label>
                                <input type="date" id="tgl_selesai" name="tgl_selesai" class="form-control" placeholder="Tanggal Selesai" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Tempat</b></label>
                                <input type="text" id="tempat" name="tempat" class="form-control" placeholder="Tempat Acara">
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
<!-- End Modal Edit Peserta -->

<!-- Modal Hapus Peserta -->
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
            <form action="{{route('acara.destroy', ['id'=>'0'])}}" method="POST" id="delete">
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
<!-- End Modal Hapus Peserta -->

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
                        <li class="breadcrumb-item active">Acara</li>
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
                            <h3 class="card-title">Data Acara</h3>
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
        $modal.find('input[name=nama]').val(data['nama']);
        $modal.find('input[name=kategori]').val(data['kategori']);
        $modal.find('input[name=tgl_mulai]').val(data['tgl_mulai']);
        $modal.find('input[name=tgl_selesai]').val(data['tgl_selesai']);
        $modal.find('input[name=tempat]').val(data['tempat']);

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
    
    $(document).ready(function(){
        oTable = $("#table1").DataTable({
            
            processing: true,
            serverSide: true,
            ajax: {type: "POST", url: '{{route("acara.data")}}', data:{'_token':@json(csrf_token())}},
            columns: [
                { data:'id', title:'ID', visible: false},
                { data:'nama', title:'Nama'},
                { data:'kategori', title:'Kategori'},
                { data:'tgl_mulai', title:'Tanggal Pelaksanaan', render: function(e,d,row){
                    return moment(row['tgl_mulai']).format('DD MMMM YYYY') + ' - ' + moment(row['tgl_selesai']).format('DD MMMM YYYY');
                } },
                { data:'tempat', title:'Tempat', visible: false},
                { data:'action', title:'Aksi'},
            ],
        });
    });
</script>
@endsection