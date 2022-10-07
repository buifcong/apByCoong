//
//  SearchViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 10/08/2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BookTableViewCell")
        viewModel.fetch()
        viewModelBinding()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.navigationBar.isHidden = true
    }
    
    func viewModelBinding(){
        viewModel.isLoadingUpdated = {[weak self] isLoading in
            if isLoading == true {
                self?.showLoading(text: nil)
            } else {
                self?.hiddenLoading()
            }
            
        }
        viewModel.arrBookUpdate = {[weak self] in
            self?.tableView.reloadData()
        }
    }

}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrBook.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as! BookTableViewCell
        cell.item = viewModel.arrBook[indexPath.row]
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        if scrollViewHeight + scrollOffset > scrollContentSizeHeight && scrollContentSizeHeight != 0 {
            if viewModel.arrBook.count >= 20  && viewModel.countItem != viewModel.arrBook.count {
                viewModel.countItem = viewModel.arrBook.count
                viewModel.getListBooks(isLoadMore: true)
            }
        }
    }
}
