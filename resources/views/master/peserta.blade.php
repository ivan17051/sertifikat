@extends('layouts.layout')

@section('title')
Data Peserta
@endsection

@section('masterShow')
menu-open
@endsection

@section('pesertaStatus')
active
@endsection

@section('content')
<!-- Modal Tambah Peserta -->
<div class="modal modal-danger fade" id="tambah" tabindex="-1" role="dialog" aria-labelledby="Tambah Peserta"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Tambah Peserta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('peserta.store')}}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label><b>NIK</b></label>
                                <input type="text" id="nik" name="nik" class="form-control" placeholder="NIK" maxlength="16" required>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="form-group">
                                <label><b>Nama</b></label>
                                <input type="text" id="nama" name="nama" class="form-control" placeholder="Nama" required>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="form-group">
                                <label><b>Tempat Lahir</b></label>
                                <input type="text" id="tempatlahir" name="tempatlahir" class="form-control" placeholder="Tempat Lahir">
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label><b>Tanggal Lahir</b></label>
                                <input type="date" id="tanggallahir" name="tanggallahir" class="form-control" placeholder="Tanggal Lahir">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Alamat</b></label>
                                <input type="text" id="alamat" name="alamat" class="form-control" placeholder="Alamat">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Unit Kerja</b></label>
                                <input type="text" id="unitkerja" name="unitkerja" class="form-control" placeholder="Unit Kerja" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Jabatan</b></label>
                                <input type="text" id="jabatan" name="jabatan" class="form-control" placeholder="Jabatan">
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
<!-- End Modal Tambah Peserta -->

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
            <form action="{{route('peserta.update', ['id'=>'0'])}}" method="POST">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label><b>NIK</b></label>
                                <input type="text" id="nik" name="nik" class="form-control" placeholder="NIK" maxlength="16" required>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="form-group">
                                <label><b>Nama</b></label>
                                <input type="text" id="nama" name="nama" class="form-control" placeholder="Nama" required>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="form-group">
                                <label><b>Tempat Lahir</b></label>
                                <input type="text" id="tempatlahir" name="tempatlahir" class="form-control" placeholder="Tempat Lahir">
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label><b>Tanggal Lahir</b></label>
                                <input type="date" id="tanggallahir" name="tanggallahir" class="form-control" placeholder="Tanggal Lahir">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><b>Alamat</b></label>
                                <input type="text" id="alamat" name="alamat" class="form-control" placeholder="Alamat">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Unit Kerja</b></label>
                                <input type="text" id="unitkerja" name="unitkerja" class="form-control" placeholder="Unit Kerja" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Jabatan</b></label>
                                <input type="text" id="jabatan" name="jabatan" class="form-control" placeholder="Jabatan">
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

<!-- Form -->
<div class="modal modal-danger fade" id="hapus" tabindex="-1" role="dialog" aria-labelledby="Hapus Peserta"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Hapus Peserta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('peserta.destroy', ['id'=>'0'])}}" method="POST" id="delete">
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

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
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
                        <li class="breadcrumb-item active">Peserta</li>
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
                            <h3 class="card-title">Data Peserta</h3>
                        </div>
                        <div class="col-md-6 text-right">
                            <button class="btn btn-primary btn-sm" data-toggle="modal"
                                data-target="#tambah">Tambah</button>
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

    var oTable;
    const isMobile = window.matchMedia("only screen and (max-width: 760px)").matches;

    function show(self){
        var tr = $(self).closest('tr');
        let idx = oTable.row(tr)[0]
        var data = oTable.data()[idx];
        
        sessionStorage.setItem('penilaian-filter', JSON.stringify(data));
        window.location.href = "{{url('/penilaian')}}";
    }

    function edit(self){
        var $modal=$('#sunting');
        var tr = $(self).closest('tr');
        let idx = oTable.row(tr)[0]
        var data = oTable.data()[idx];
        // console.log(data);
        
        $modal.find('input[name=id]').val(data['id']);
        $modal.find('input[name=nik]').val(data['nik']);
        $modal.find('input[name=nama]').val(data['nama']);
        $modal.find('input[name=tempatlahir]').val(data['tempatlahir']);
        $modal.find('input[name=tanggallahir]').val(data['tanggallahir']);
        $modal.find('input[name=alamat]').val(data['alamat']);
        $modal.find('input[name=unitkerja]').val(data['unitkerja']);
        $modal.find('input[name=jabatan]').val(data['jabatan']);

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
            ajax: {type: "POST", url: '{{route("peserta.data")}}', data:{'_token':@json(csrf_token())}},
            columns: [
                { data:'id', title:'ID', visible: false},
                { data:'nik', title:'NIK', name:'nik'},
                { data:'nama', title:'Nama'},
                { data:'tempatlahir', title:'Tempat, Tanggal Lahir', render: function(e,d,row){
                    return row['tempatlahir'] + ', ' + moment(row['tanggallahir']).format('DD MMMM YYYY');
                } },
                { data:'tanggallahir', title:'Tanggal Lahir', visible: false},
                { data:'alamat', title:'Alamat', visible: false},
                { data:'unitkerja', title:'Unit Kerja'},
                { data:'jabatan', title:'Jabatan'},
                { data:'action', title:'Aksi'},
            ],
        });
    });

    //filter tabel
    function filter(value, fieldDB, isRemove=false, delimitter="|"){
        let column = fieldDB+':name';
        let currentSearch = oTable.column(column).search();
        
        if(isRemove==true){
            currentSearch = currentSearch.split(delimitter);
            var index = currentSearch.indexOf(value);
            
            if (index !== -1) {
                currentSearch.splice(index, 1);
            }
            input = ''
            currentSearch.forEach(unit => {
                if(input==''){
                    input = unit;
                }
                else{
                    input += ('|'+unit);
                }
            });
            if(currentSearch==[]) input='';
            currentSearch = input;
        }
        else{
            if(currentSearch==''){
                currentSearch = value;
            }
            else{
                currentSearch += ('|'+value);
            }
        }
        
        oTable.column(column).search( currentSearch , true, false);
        oTable.draw();
    }

    document.getElementById('filter').addEventListener( 'addItem', function(e) {
            let id = 'id'+e.detail.groupValue.toLowerCase();
            filter(e.detail.value, id )
        },
        false,
    );

    document.getElementById('filter').addEventListener( 'removeItem', function(e) {
            let id = 'id'+e.detail.groupValue.toLowerCase();
            filter(e.detail.value, id, true )
        },
        false,
    );
</script>
@endsection